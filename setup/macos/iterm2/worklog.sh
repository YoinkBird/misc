cat <<EOM > /dev/null
# PURPOSE:
# https://medium.com/seokjunhong/customize-the-terminal-zsh-iterm2-powerlevel10k-complete-guide-for-beginners-35c4ba439055
EOM

# capture current settings after much manual modification
defaults read com.googlecode.iterm2 > backup_current.plist
# convert plist to json: https://getpenguin.app/knowledge-base/plist-to-json/
# vvv creates file called: <stdin>
# defaults read com.googlecode.iterm2 | plutil -convert json -
# => somehow, it is literally creating files called '<stdin>' and 'stdout', therefore need to explicitly specify the paths
# man plutil
# Specifying - as an input file reads from stdin.
# Specifying - as the path outputs to stdout.
defaults read com.googlecode.iterm2 | plutil -convert json -o - - |jq


# delete all settings, compare against previous state
cat <<EOM > /dev/null
# ONE-OFF, don't do this again! # defaults delete com.googlecode.iterm2
EOM
