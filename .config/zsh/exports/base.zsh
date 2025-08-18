export MANPAGER='nvim +Man!'
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

# User aliases
if [ $(ls "$ZDOTDIR/exports/user.d" | wc -l) -ne 0 ]; then
    for f in $ZDOTDIR/exports/user.d/*; do source $f; done
fi
