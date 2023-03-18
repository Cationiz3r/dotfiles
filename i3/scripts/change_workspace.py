#!/bin/python
import re
import sys
import i3ipc

i3 = i3ipc.Connection()
active_workspaces = i3.get_workspaces()
for ws in active_workspaces:
	if ws.focused:
		current = int(ws.name.split(":", 1)[0])
		break

config = i3.get_config()
lines = config.ipc_data["included_configs"][0]["raw_contents"].split("\n")
workspaces = {}
for line in lines:
	match = re.search("^set \$ws[0-9]+(_[0-9]+)? [0-9]+:[A-Za-z]+$", line)
	if match:
		index, name = line.split(" ", 3)[2].split(":")
		workspaces[int(index)] = name

primary = current // 10 * 10
if sys.argv[1] == "next":
	## Next workspace
	target = primary + 10
	if not target in workspaces:
		target = 10
elif sys.argv[1] == "prev":
	## Prev workspace
	target = primary - 10
	if not target in workspaces:
		target = 80
else:
	## Next sub-workspace
	target = current + 1
	if not target in workspaces:
		target = primary

target_full = f"{target}:{workspaces[target]}"
i3.command("move container to workspace " + target_full)
i3.command("workspace " + target_full)
