#!/bin/zsh

if ! { [ -n "$TMUX" ]; } then	
	tmux a

	if [ $? -ne 0 ]
	then
		tmux
	fi
fi

