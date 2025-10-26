
// The ps command reports information about active processes.
#!/bin/bash

ps --forest -o ppid,pid,vsz,rss,comm -C nginx
