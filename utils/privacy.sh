

set -ue 
set -x
#replaceme=$1; shift;
runme=$1; shift;
anonuser="myuser";

dbecho="echo";
if [[ ${runme} -eq 1 ]]; then
  dbecho="";
fi

# (@arr=getpwnam($ENV{USER})); $i=0; print( map({sprintf("[%d] %s\n", $i++ , $_)} @arr)); print("$arr[7]\n");
username=$( getent passwd $USER | awk -F: '{printf $1}' );
userhome=$( getent passwd $USER | awk -F: '{printf $6}' );

# iterate over args . src: https://stackoverflow.com/a/255913
while [[ $# > 0 ]]; do
  file=$1; shift;

  $dbecho perl -i -ple "s|$userhome|/home/$anonuser|g" $file
#  git diff --word-diff
  # exit;

  # replacement host
  anonhost=$( echo $HOSTNAME | sed "s|${username}|${anonuser}|g" );
  anonhost="myhostname";
  $dbecho env HOSTNAME=$HOSTNAME perl -i -ple 's|$ENV{HOSTNAME}|'${anonuser}'-host|g' $file ;
#  git diff --word-diff
  # exit;

  # crude IP address removal, don't care if it matches too much
  #+ got it almost on first try, forgot to have word boundaries. src: https://www.regular-expressions.info/ip.html
  $dbecho perl -i -ple 's|\b\d{1,3}\.\d{1,3}.\d{1,3}\.\d{1,3}|192.xxx.xxx.xxx|g' $file
#  git diff --word-diff
  $dbecho perl -i -ple 's|\b(192.xxx.xxx.xxx):\d+\b|$1:port|g' $file
  # exit;


  # finally, replace the name
  $dbecho perl -i -ple "s|$username|$anonuser|g" $file
#  git diff --word-diff
  # exit;

  # verify
  git diff --word-diff
  grep -rns ${username} $file || echo "file $file contains no instances of ${username}";
done

