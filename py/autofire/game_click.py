#!/usr/bin/python3
from random import randint
import game_window as poe
import pyautogui
# No more click's than this value.
inventory_limit = 60
items_moved_to_inventory = 0

def click_items(items):
    global items_moved_to_inventory
    for item in items:
        click(item)
        items_moved_to_inventory += 1
        if items_moved_to_inventory == inventory_limit:
            break


def click(item):
    # Absolute position plus some noise
    left = item.left + poe.left - randint(0, 20)
    top = item.top + poe.top - randint(0, 20)

    pyautogui.moveTo(left, top, 0.08, _pause=False)
    pyautogui.keyDown('ctrl')
    pyautogui.click()
    pyautogui.keyUp('ctrl')

