#!/bin/env python3
import sys
import json
import ast

for line in sys.stdin:
    print(json.dumps(ast.literal_eval(line)))
