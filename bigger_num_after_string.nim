import strutils, nre, parseutils, algorithm, strformat, tables

"""
查找字符串后面的最大数字
"""

#~ var data ="a01a09a100b101b09b99"
var data = "010001a01a09a100b101b09b99cc01020103dd0甲190甲19purebasic111100丁0purebasic0123甲019乙"
var tab = initOrderedTable[string, int]()
var
    key: string
    val: int

for i in findIter(data, re"([\D]{1,})(\d{1,})"):
    key = i.captures[0]
    val = i.captures[1].parseInt

    if not (key in tab):
        tab[key] = val
    else:
        if tab[key] < val:
            tab[key] = val

for key, val in tab.pairs:
    echo fmt"{key} => {val}"
