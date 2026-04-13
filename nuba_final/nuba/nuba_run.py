#!/usr/bin/env python3
# nuba  -  thin wrapper so you can do:  python nuba my.nu
import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from nuba_cli import main
main()
