#!/bin/bash
echo "====================================="
echo "     System Operating Processes "
echo "====================================="

ps -xo comm | sort | uniq | grep -v sh | more
