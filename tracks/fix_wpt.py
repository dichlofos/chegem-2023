#!/usr/bin/env python3

import re

contents = None
with open('wpt.gpx', 'r') as f:
    contents = f.read()

C = {"prival": 0}

def replacer(m):
    C["prival"] += 1
    x = C["prival"]
    print(f">П{x}<")
    return f">П{x}<"

prival = r">П([0-9]*?)<"
contents = re.sub(prival, replacer, contents)
print(C)

with open('wpt.gpx', 'w') as f:
    f.write(contents)
