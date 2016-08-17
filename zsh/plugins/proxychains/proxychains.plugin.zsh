# ------------------------------------------------------------------------------
# Description
# -----------
#
# proxychains4 will be inserted before the command
#
# ------------------------------------------------------------------------------
# Authors
# -------
#
# * Anson Hu <huhuan2048@gmail.com>
#
# ------------------------------------------------------------------------------

proxychains4-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    isSudo=false
    if [[ $BUFFER == sudo\ * ]]; then
      isSudo=true
      LBUFFER="${LBUFFER#sudo }"
    fi
    if [[ $BUFFER == proxychains4\ * ]]; then
        LBUFFER="${LBUFFER#proxychains4 }"
    else
        LBUFFER="proxychains4 $LBUFFER"
    fi
    if [[ $isSudo == true ]]; then
      LBUFFER="sudo $LBUFFER"
    fi
}
zle -N proxychains4-command-line
# Defined shortcut keys: [`] [`]
bindkey "\`\`" proxychains4-command-line
