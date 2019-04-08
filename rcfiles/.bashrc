export CLICOLOR=1
# vim mode - command, insert
#+ TODO: enable common shortcuts within insert mode, e.g. ctrl+a and ctrl+l
set -o vi
#
# bash lists the status of any stopped and running jobs before exiting an interactive shell
shopt -s checkjobs
# press C-d 3 times to exit interactive shell. src: https://unix.stackexchange.com/questions/139115/disable-ctrl-d-window-close-in-terminator-terminal-emulator ; src: man bash
export IGNOREEOF=2

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
  # display return-code in prompt; set to 'green' for '0' and 'red' for 'non-zero'
  if [[ "${rc}" -eq 0 ]]; then
    PS1="[rc:\[\e[32m\]$rc\[\e[m\]]"
  else
    PS1="[rc:\[\e[31m\]$rc\[\e[m\]]"
  fi
  # append remainder of args
  # readline : (color) description
  # -------------------------------
  # \s : (default) shell-name (bash)
  # \t : (blue)    time
  # \u : (default) user
  # \w : (yellow)  working dir
  # parse_git_branch : display git branch and status
  PS1="${PS1}[\s][\[\e[34m\]\t\[\e[m\]][\u][\[\e[33m\]\w\[\e[m\]]\`parse_git_branch\` \n"
}

# updates prompt every time
PROMPT_COMMAND=__prompt_command
