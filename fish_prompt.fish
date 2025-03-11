function fish_prompt
if test $status -eq 0
set_color green
echo -n "시작"
else
set_color red
echo -n "오류"
end
set_color cyan
echo -n (whoami)
set_color white
echo -n "@"
set_color yellow
echo -n (hostname)
set_color normal
echo -n ' ~> '
end
