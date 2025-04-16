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
---
# ONE-OFF, don't do this again!
% defaults delete com.googlecode.iterm2

---
Not sure whether settings actually got reset:
after deleting defaults, the following option was still set:
'left ⌥ key acts as +ESC'
but it was thought to have been "not the default"

Therefore, going to completely uninstall and check the resulting settings:

% brew uninstall iterm2

Following is left:

# manual modify output, no clean fast way to just show the link => target
% ls -ltr ~/.config/iterm2 
total 0
AppSupport -> /Users/<>/Library/Application Support/iTerm2
sockets

% tree ~/"Library/Application Support/iTerm2"
/Users/<>/Library/Application Support/iTerm2
├── DynamicProfiles
├── iterm2-daemon-1.socket
├── iterm2-daemon-1.socket.lock
├── iTermServer-3.5.13
├── SavedState
│   ├── lock
│   ├── restorable-state.sqlite
│   ├── restorable-state.sqlite-shm
│   └── restorable-state.sqlite-wal
├── Scripts
└── version.txt



EOM
