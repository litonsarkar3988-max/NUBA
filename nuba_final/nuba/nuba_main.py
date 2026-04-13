#!/usr/bin/env python3
# nuba_main.py  —  thin shim that delegates to bin/nuba
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from bin.nuba import main
main()
