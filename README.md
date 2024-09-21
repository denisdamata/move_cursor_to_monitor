Program provided by ChatGPT3.5 from OpenAI.

This program's function is to change the position of the mouse cursor to another monitor. Through a customized shortcut, you can toggle the cursor position between different monitors. This program was designed to be used with GRID-NAV from KEYNAV, as the navigation grid depends on which monitor the cursor is on. ChatGPT has limitations, but with the command `xrandr --listactivemonitors` to list the monitors, ChatGPT was able to easily create this program. 

First:
```
chmod +x move_cursor_to_monitor.sh
```

Each screen is identified by an integer starting from 0. The program uses the screen identifier number to move the cursor to the center of the desired screen. You have to provide the number, for example:

```
./move_cursor_to_monitor.sh 0 #Place the cursor in the center of the first screen.
./move_cursor_to_monitor.sh 1 #Idem second screen.
```
