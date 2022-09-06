#! /usr/bin/python3
# coding=utf-8
###########################################
# @File: jungle.py
# @Author:   zyw9
# @DateTime: 2022-08-28 16:09:56
###########################################


from __future__ import (absolute_import, division, print_function)

from ranger.colorschemes.default import Default
from ranger.gui.color import green, red, blue


class Scheme(Default):
    progress_bar_color = green

    def use(self, context):
        fg, bg, attr = Default.use(self, context)

        if context.directory and not context.marked and not context.link \
                and not context.inactive_pane:
            fg = green

        if context.in_titlebar and context.hostname:
            fg = red if context.bad else blue

        return fg, bg, attr
