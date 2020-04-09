# This program displays the fibonacci sequence
import os
import strutils

proc main(): cint {.discardable.} =
    # Check for user input
    if paramCount() != 1:
        echo "usage: fibonacci [rank]'"
        #~ exit
        return

    # Parse first argument and cast it to int
    var stop = paramStr(1).parseInt

    # Can only calculate correctly until rank 92
    if stop > 92:
        echo "rank must be 92 or less"
        return

    # Three consecutive terms of the sequence
    var a: uint64 = 0
    var b: uint64 = 0
    var c: uint64 = 1

    for i in 0 ..< stop:
        # Set a and b to the next term
        a = b
        b = c
        # Compute the new term
        c = a + b

        # Print the new term
        echo c


when isMainModule:
    main()
