# when leaving the console clear the screen to increase privacy
sudo clear

USERSQLH=~/.mysql_history
USERBH=~/.bash_history
ROOTSQLH=//root/.mysql_history
ROOTBH=//root/.bash_history

[ -f "$USERSQLH" ] && sudo rm $USERSQLH
[ -f "$USERBH" ] && sudo rm $USERBH
[ -f "$ROOTSQLH" ] && sudo rm $ROOTSQLH
[ -f "$ROOTBH" ] && sudo rm $ROOTBH

history -c
sync;

exit 
exit
