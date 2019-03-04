#export CLICOLOR=1
set -o vi
# generated with: http://ezprompt.net/
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

function nonzero_return() {
	RETVAL=$?
        echo $RETVAL
	[ $RETVAL -ne 0 ] && echo $RETVAL
          #echo '\[\e[31m\]'$RETVAL'\[\e[m\]'
#          || echo "\[\e[32m\]\`$RETVAL\`\[\e[m\]"
}

__prompt_command(){
  local rc="$?"
  #if [[ ! -z "${rc}" ]]; then
  if [[ "${rc}" -eq 0 ]]; then
    #PS1="[rc:$rc][\s][\[\e[34m\]\t\[\e[m\]][\u][\[\e[33m\]\w\[\e[m\]]\`parse_git_branch\` "
    PS1="[rc:\[\e[32m\]$rc\[\e[m\]][\s][\[\e[34m\]\t\[\e[m\]][\u][\[\e[33m\]\w\[\e[m\]]\`parse_git_branch\` "
  else
    PS1="[rc:\[\e[31m\]$rc\[\e[m\]][\s][\[\e[34m\]\t\[\e[m\]][\u][\[\e[33m\]\w\[\e[m\]]\`parse_git_branch\` "
  fi
}

# export PS1="[rc:\[\e[31m\]\`nonzero_return\`\[\e[m\]][\s][\[\e[34m\]\t\[\e[m\]][\u][\[\e[33m\]\w\[\e[m\]]\`parse_git_branch\` "
# export PS1="[rc:`echo $?`][\s][\[\e[34m\]\t\[\e[m\]][\u][\[\e[33m\]\w\[\e[m\]]\`parse_git_branch\` "

PROMPT_COMMAND=__prompt_command
