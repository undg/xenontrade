#!/bin/env python3
import autopy
from pynput.mouse import Listener as MouseListener, Button
from pynput.keyboard import Listener as KeyboardListener, Key
# import logging
import random as Random


MOUSE_BUTTON = Button.button9
KEY_ONE = Key.shift_l
KEY_TWO = Key.ctrl_l

# logging.basicConfig(filename="mouse_log.txt",
#                     level=logging.DEBUG, format='%(asctime)s: %(message)s')


def log(str):
    print(str)
    # logging.info(str)


mouse_pressed = False
key_pressed = False


def autofire(x, y):
    global mouse_pressed
    global key_pressed
    return mouse_pressed and key_pressed and pixelPadding(x, y)


def on_move(x, y):
    log("mouse position: ({0}, {1})".format(x, y))
    if autofire(x, y):
        log("Mouse clicked on ({0}, {1})".format(x, y))
        autopy.mouse.click(delay=rand_ms())


def on_click(x, y, button, pressed):
    global mouse_pressed
    if button == MOUSE_BUTTON:
        if pressed:
            mouse_pressed = True
            log(
                'Mouse clicked at ({0}, {1}) with {2} [{3}]'.format(x, y, button, pressed))
        else:
            mouse_pressed = False
            log(
                'Mouse released at ({0}, {1}) with {2} [{3}]'.format(x, y, button, pressed))


def on_press(key):
    global key_pressed
    if trigger_key_pressed(key):
        key_pressed = True
        log('Key pressed ({0})'.format(key))


def on_release(key):
    global key_pressed
    key_pressed = False
    log('Key released ({0})'.format(key))


def pixelPadding(x, y):
    padding = Random.randrange(3) + 2
    return x % padding == 0 and y % padding == 0


def rand_ms():
    one_or_two_ms = Random.randrange(1) / 10 + 0.1
    noise = Random.randrange(99999)/1000000
    return one_or_two_ms + noise


def trigger_key_pressed(key):
    return key == KEY_ONE or key == KEY_TWO


mouse_listener = MouseListener(on_move=on_move, on_click=on_click)
keyboard_listener = KeyboardListener(on_press=on_press, on_release=on_release)

mouse_listener.start()
keyboard_listener.start()
mouse_listener.join()
keyboard_listener.join()
