function hrd \
   --description 'Heroku: Restart a detroit- app'

  set appname $argv[1]

  heroku restart -a detroit-$appname
end
