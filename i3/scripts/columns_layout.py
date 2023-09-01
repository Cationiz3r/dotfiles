#!/bin/python3
# Original: https://aduros.com/blog/hacking-i3-automatic-layout/
# Automatically splits windows in a workspace to a number of columns.

from i3ipc import Connection
from i3ipc import Event
from i3ipc.con import Con

COLUMNS = 2

def move_container(container1: Con, container2: Con):
	container2.command("mark __column-layout")
	container1.command("move window to mark __column-layout")
	container2.command("unmark __column-layout")

def on_window_close(conn: Connection, _):
	for reply in conn.get_workspaces():
		if not reply.focused:
			return

		workspace = conn.get_tree().find_by_id(reply.ipc_data["id"]).workspace()

		if len(workspace.nodes) == 1 and len(workspace.nodes[0].nodes) == 1:
			child = workspace.nodes[0].nodes[0]
			move_container(child, workspace)

def on_window_change(conn: Connection, event: Event):
	window = conn.get_tree().find_by_id(event.container.id)
	if window is None:
		return

	workspace = window.workspace()
	if workspace is None or len(workspace.nodes) < COLUMNS:
		return

	for node in workspace.nodes:
		if node.layout != "splitv":
			node.command("splitv")

i3 = Connection()
i3.on(Event.WINDOW_CLOSE, on_window_close)
i3.on(Event.WINDOW_NEW, on_window_change)
i3.on(Event.WINDOW_MOVE, on_window_change)
i3.main()
