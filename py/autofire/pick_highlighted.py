#!/usr/bin/python3
from PIL import Image
from game_click import click_items
import game_window as poe
import glob
import mss
import mss.tools
import pyautogui

# Png samples that will be located on screenshoot
highlight_path = './img/highlight/*.png'
img_highlight_needles = glob.glob(highlight_path, recursive=False)



with mss.mss() as sct:
    # The screen part to capture
    region = {"top": poe.top, "left": poe.left, "width": poe.width, "height": poe.height}
    # Grab the data
    sct_img = sct.grab(region)
    # Create the Image in PIL format
    screenshot = Image.frombytes("RGB", sct_img.size, sct_img.bgra, "raw", "BGRX")
    for img_highlight in img_highlight_needles:
        items = list(pyautogui.locateAll(img_highlight, screenshot))
        click_items(items)
