# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

. ~/dev/pvm/pvm.sh

#Completion to PVM
[[ -r $PVM_DIR/bash_completion ]] && . $PVM_DIR/bash_completion

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s /Users/gonto/.nvm/nvm.sh ]] && . /Users/gonto/.nvm/nvm.sh # This loads NVM

