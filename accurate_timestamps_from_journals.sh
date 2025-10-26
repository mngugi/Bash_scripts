#!/bin/bash

// getting accurate time stamps 

journalctl --since "2025-10-26 00:00" | grep "Mounted"

