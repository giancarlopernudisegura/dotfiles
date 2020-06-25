from libqtile.config import Key, Group
from libqtile.lazy import lazy
from keybindings import mod

group_names = [
	('', ['alacritty']),
	('謹', []),
	('', ['brave']),
	('', []),
	('', []),
	('', []),
	('', []),
	('', []),
	('', []),
	('', ['alacritty -e gotop -c vice -pa', 'gpmdp', 'sleep 3 && slack']),
]

groups = [Group(name, spawn=spawn_list) for name, spawn_list in group_names]

workspaces = []

for i, group in enumerate(groups, 1):
	name = str(i % len(group_names))
	workspaces.extend([
		Key([mod], name, lazy.group[group.name].toscreen()),
		Key([mod, "shift"], name, lazy.window.togroup(group.name, switch_group=True)),
	])

workspaces.extend([
	Key([mod], 'bracketleft', lazy.screen.prev_group()),
	Key([mod], 'bracketright', lazy.screen.next_group())
])
