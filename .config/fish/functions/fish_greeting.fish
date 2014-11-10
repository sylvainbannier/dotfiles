function fish_greeting
	set todos (cat ~/TODO | grep '\[ \]' | wc -l)
	set firsttodo (cat ~/TODO | grep '\[ \]' | head -n 1)
	echo "$todos TODO / $firsttodo"

end
