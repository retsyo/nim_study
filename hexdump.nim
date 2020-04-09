import streams
import os
import strutils
import sequtils
import strformat

if paramCount() > 0:
    proc toHex(s1: string): string =
        var s2: string
        for i in s1:
            s2 &= fmt" {int(i):02x}"
        s2 &= "   ".repeat(16-len(s1))
        return s2

    proc toString(s1: string): string =
        var s2: string = ""
        for i in s1:
            #~ echo "i=", i
            if i in "\n\r\t\a":
                #~ echo "in"
                s2 &= "."
            else:
                #~ echo "not in"
                s2 &= i
        return s2

    var fIn = newFileStream(paramStr(1))
    defer: fIn.close()

    var s1 = fIn.readStr(16)

    if s1.len > 0:
        var hRuler1 = ""
        var hRuler2 = ""
        for i in 0..15:
            hRuler1 &= fmt" {i:02X}"
            hRuler2 &= fmt"{i:X}"

        echo "  offset:", hRuler1, " | ", hRuler2
        echo "_".repeat(len("  offset:") + len(hRuler1) + len(" | ") + len(hRuler2))

        var idxRow = 0
        while s1.len > 0:
            echo fmt"{idxRow:08X}:", toHex(s1), " | ", toString(s1)

            s1= fIn.readStr(16)

            idxRow += 16
    else:
        echo fmt"文件 {paramStr(1)} 是0字节的空文件"

else:
    echo "使用方法：hexdump 文件"
