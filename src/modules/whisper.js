class Whisper {
    /**
     * Creates a new Whisper object
     * // TODO: JSDocs
     *
     * @constructor
     */
    constructor(message) {
        this.message = message;
        this.tradeInfo = this._getItemTradeInfo() || this._getBulkTradeInfo();
    }

    _getItemTradeInfo() {
        let message = this.message.message;
        const stashInfo = this._getStashInfo();
        const tradeInfo = this.getDefaultTradeInfo();

        tradeInfo.type = "item";

        // Stash
        if(stashInfo != null) {
            // Remove stash information from message
            message = message.replace(stashInfo.message, "");
            // delete(stashInfo.message);
        }

        tradeInfo.stash = stashInfo;

        // Trade
        const pattern = /(wtb|Hi, I would like to buy your) (.+) listed for ([0-9.]+) (.+) in (.+)/;
        const match = message.match(pattern);

        if(match) {
            tradeInfo.receive.amount = "";
            tradeInfo.receive.name = match[2];
            tradeInfo.pay.amount = parseFloat(match[3]);
            tradeInfo.pay.name = match[4];
            tradeInfo.league = match[5];
            tradeInfo.trade = match[2] + " for " + match[3] + " " + match[4];

            return tradeInfo;
        }

        return null;
    }

    _getBulkTradeInfo() {
        const message = this.message.message;
        const tradeInfo = this.getDefaultTradeInfo();

        tradeInfo.type = "bulk";

        // Trade
        var pattern = /I'd like to buy your ([0-9.]+) (.+) for my ([0-9.]+) (.+) in (.+)\./;
        var match = message.match(pattern);

        if(match) {
            tradeInfo.receive.amount = parseFloat(match[1]);
            tradeInfo.receive.name = match[2];
            tradeInfo.pay.amount = parseFloat(match[3]);
            tradeInfo.pay.name = match[4];
            tradeInfo.league = match[5];
            tradeInfo.trade = match[1] + " " + match[2] + " for " + match[3] + " " + match[4];

            return tradeInfo;
        }

        return null;
    }

    _getStashInfo() {
        const pattern = / \(stash(?: tab)? "(.+)";(?: position:)? left ([0-9]+), top ([0-9]+)\)/;
        const match = this.message.message.match(pattern);

        if(match) {
            return {
                message: match[0],
                tab: match[1],
                left: match[2],
                top: match[3]
            };
        }

        return null;
    }

    getDefaultTradeInfo() {
        return {
            type: null,
            pay: {
                amount: 0,
                name: null
            },
            receive: {
                amount: 0,
                name: null
            },
            stash: {
                tab: null,
                top: 0,
                left: 0
            },
            league: null,
            trade: null
        }
    }

    isTradeMessage() {
        return this.tradeInfo != null;
    }

    hasStashData() {
        return this.tradeInfo.stash.tab != null
    }

    hasLeague() {
        return this.tradeInfo.league != null
    }

    getTradeInfo() {
        return this.tradeInfo;
    }

    getMessage() {
        return this.message;
    }

    getDirection() {
        return this.message.direction;
    }

    getTradeType() {
        return this.tradeInfo.type;
    }
}

module.exports = Whisper;
