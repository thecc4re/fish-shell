function down-or-search -d "Depending on cursor position and current mode, either search forward or move down one line"
	# If we are already in search mode, continue
	if commandline --search-mode
		commandline -f history-search-forward
		return
	end

	# We are not already in search mode.
	# If we are on the bottom line, start search mode,
	# otherwise move down
	set lineno (commandline -L)
	set line_count (commandline|wc -l)

	switch $lineno
		case $line_count
		commandline -f history-search-forward

		case '*'
		commandline -f down-line
	end
end
