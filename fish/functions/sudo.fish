function sudo \
   --description "Repeat last command with sudo when sudo is ran with !! as argument"

  if test "$argv" = !!
    eval command sudo $history[1]
  else
    command sudo $argv
  end
end
