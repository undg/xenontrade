const { exec } = require("child-process-es6-promise");
const os = require("os");
const path = require("path");
const request = require("request-promise-native");
const ffi = require("ffi");
const { clipboard } = require("electron");
const robot = require("robotjs");

class PathOfExile {
    /**
     * Focuses the Path of Exile window based on the OS
     */
    static focus() {
        if (os.platform() === "linux") {
            PathOfExile._focusOnLinux();
        } else if (os.platform() === "win32") {
            PathOfExile._focusOnWindows();
        }
    }

    /**
     * Focuses the game on Linux
     */
    static _focusOnLinux() {
        exec("wmctrl -F -a 'Path of Exile'").catch(() =>
            alert(
                "Tried to focus Path of Exile but failed, either wmctrl is not installed or Path of Exile is not running"
            )
        );
    }

    /**
     * Focuses the game on Windows
     *
     * return {void}
     */
    static _focusOnWindows() {
        const user32 = new ffi.Library("user32", {
            GetTopWindow: ["long", ["long"]],
            FindWindowA: ["long", ["string", "string"]],
            SetActiveWindow: ["long", ["long"]],
            SetForegroundWindow: ["bool", ["long"]],
            BringWindowToTop: ["bool", ["long"]],
            ShowWindow: ["bool", ["long", "int"]],
            SwitchToThisWindow: ["void", ["long", "bool"]],
            GetForegroundWindow: ["long", []],
            AttachThreadInput: ["bool", ["int", "long", "bool"]],
            GetWindowThreadProcessId: ["int", ["long", "int"]],
            SetWindowPos: [
                "bool",
                ["long", "long", "int", "int", "int", "int", "uint"],
            ],
            SetFocus: ["long", ["long"]],
        });

        const kernel32 = new ffi.Library("Kernel32.dll", {
            GetCurrentThreadId: ["int", []],
        });

        const winToSetOnTop = user32.FindWindowA(null, "Path of Exile");
        const foregroundHWnd = user32.GetForegroundWindow();
        const currentThreadId = kernel32.GetCurrentThreadId();
        const windowThreadProcessId = user32.GetWindowThreadProcessId(
            foregroundHWnd,
            null
        )
        user32.ShowWindow(winToSetOnTop, 9);
        user32.SetWindowPos(winToSetOnTop, -1, 0, 0, 0, 0, 3);
        user32.SetWindowPos(winToSetOnTop, -2, 0, 0, 0, 0, 3);
        user32.SetForegroundWindow(winToSetOnTop);
        user32.AttachThreadInput(windowThreadProcessId, currentThreadId, 0);
        user32.SetFocus(winToSetOnTop);
        user32.SetActiveWindow(winToSetOnTop);
    }

    /**
     * Gets Path of Exile leagues that are non-SSF from GGG API and returns the names
     *
     * @returns {Promise}
     * @fulfil {Array} - An array containing every main non-SSF league
     * @reject {Error} - The `error.message` contains information about why the promise was rejected
     */
    static getLeagues() {
        return new Promise((resolve, reject) => {
            request("http://api.pathofexile.com/leagues?type=main", {
                json: true,
                headers: { Connection: "keep-alive" },
            })
                .then((leagues) => {
                    // Iterate through each league
                    resolve(
                        leagues
                        .filter((league) => !PathOfExile._isSoloLeague(league))
                        .map((league) => league.id)
                    )
                })
                .catch((error) => {
                    reject(error)
                })
        })
    }

    /**
     * Focuses Path of Exile and send keys
     *
     * @param {string} text to send
     * @param {function} callback robot.keyToggle() key sequences
     * @param {boolean} [send=true] Whether the key sequence should be sent automatically
     */
    static sendMakro(message, macroCallback, send = true) {
        PathOfExile.focus();

        const previousClipboard = clipboard.readText();
        clipboard.writeText(message);

        let intervalCount = 0;
        const interval = setInterval(() => {
            // Send chat message if PoE is focused
            if (app.poeFocused && clipboard.readText() === message) {
                clearInterval(interval);
                robot.setKeyboardDelay(25);
                macroCallback();

                if (send) {
                    robot.keyToggle("enter", "down")
                    robot.keyToggle("enter", "up")
                }

                // Restore clipboard content
                setTimeout(() => clipboard.writeText(previousClipboard), 45);
            }

            // Clear interval if focusing Path of Exile is taking too long
            if (intervalCount >= 500) {
                clearInterval(interval);
                clipboard.writeText(previousClipboard);
            }

            intervalCount++;
        }, 0);
    }

    /**
     * Focuses Path of Exile and sends a message in chat
     *
     * @param {string} message Chat message
     * @param {boolean} [send=true] Whether the message should be sent automatically
     */
    static chat(message, send = true) {
        PathOfExile.sendMakro(
            message,
            () => {
                robot.keyToggle("enter", "up")
                robot.keyToggle("enter", "down")
                robot.keyToggle("enter", "up")
                robot.keyToggle("control", "down")
                robot.keyToggle("a", "down")
                robot.keyToggle("a", "up")
                robot.keyToggle("v", "down")
                robot.keyToggle("v", "up")
                robot.keyToggle("control", "up")
            },
            send
        );
    }

    /**
     * Focuses Path of Exile and input string in search box
     *
     * @param {string} item to search in inventory
     * @param {boolean} [send=true] Whether the search should be sent automatically
     */
    static stashSearch(itemName, send = true) {
        PathOfExile.sendMakro(
            itemName,
            () => {
                robot.keyToggle("control", "down");
                robot.keyToggle("f", "down")
                robot.keyToggle("f", "up")
                robot.keyToggle("v", "down")
                robot.keyToggle("v", "up")
                robot.keyToggle("control", "up");
            },
            send
        );
    }

    /**
     * Run shell script that grabbing highlighted items from stash.
     *
     * @return {void}
     */
    static grabFromStash() {
        const pyPath = path.join(process.resourcesPath, "/py/autofire/");
        const pyScript = "pick_highlighted.py";
        const command = "python " + pyScript;

        exec(command, {
            cwd: pyPath,
        })
        // .then(res=>alert(res.stdout))
            .catch((err) => alert(err));
    }

    /**
     * Returns `true` for solo self found league
     *
     * @return {boolean}
     */
    static _isSoloLeague(league) {
        return league.rules.find((rule) => rule.name === "Solo") || false;
    }
}

module.exports = PathOfExile;
