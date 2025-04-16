# from: https://medium.com/seokjunhong/customize-the-terminal-zsh-iterm2-powerlevel10k-complete-guide-for-beginners-35c4ba439055
# https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#installation
brew install powerlevel10k
# https://github.com/zsh-users/zsh-syntax-highlighting
brew install zsh-syntax-highlighting
cat <<EOM > /dev/null
To activate the syntax highlighting, add the following at the end of your .zshrc:
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

If you receive "highlighters directory not found" error message,
you may need to add the following to your .zshenv:
  export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
EOM
