# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file


# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

. ~/dev/pvm/pvm.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s /Users/gonto/.nvm/nvm.sh ]] && . /Users/gonto/.nvm/nvm.sh # This loads NVM

