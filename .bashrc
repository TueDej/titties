[[ $- != *i* ]] && return

# ----
# PATH
# ----

appendpath () {  # VOID
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

appendpath "$HOME/.local/bin"
appendpath "$HOME/.npm-global/bin"
appendpath "$ANDROID_HOME/cmdline-tools/latest/bin"
appendpath "$ANDROID_HOME/platform-tools"
appendpath "$ANDROID_HOME/build-tools"
appendpath "$HOME/.mimocode/bin"
appendpath "$HOME/.cargo/bin"
unset appendpath

# -------
# History
# -------

export HISTCONTROL='ignoredups:erasedups:ignorespace'
export HISTIGNORE='history:clear:exit:ls:bg:fg:jobs'
export HISTSIZE=5000
export HISTFILESIZE=15000
export HISTTIMEFORMAT='%F %T '

shopt -s histappend histverify cmdhist

# -------------
# Shell options
# -------------

shopt -s checkwinsize \
    extglob  \
    cdspell  \
    dirspell \
    autocd   \
    globstar

# -------
# Aliases
# -------

alias ls='ls --color=auto --group-directories-first'
alias la='ls --color=auto -A --group-directories-first'
alias ll='ls --color=auto -ltrh --group-directories-first'
alias lla='ls --color=auto -ltrAh --group-directories-first'

alias grep='grep --color=auto'
alias diff='diff --color=auto'

alias rm='rm -Iv'
alias cp='cp -i'
alias mv='mv -i'

alias psgrep='pgrep -ia'

alias sospend='swaylock && loginctl suspend'
alias hibernate='swaylock && loginctl hibernate'

# -----------------------
# Foot app-id integration
# -----------------------

footappid() {
    printf '\033]176;%s\033\\' "$1"
}

withfootappid() {
    local id="$1"
    shift
    footappid "$id"
    command "$@"
    local status=$?
    footappid 'foot'
    return $status
}

vim () { withfootappid foot-vim vim "$@"; }
ssh () { withfootappid foot-ssh ssh "$@"; }

# ---------------
# OSC integration
# ---------------

__osc133_precmd()  { printf '\e]133;A\e\\'; }
__osc133_postcmd() { printf '\e]133;D\e\\'; }

__osc7_cwd() {  # Simpler version of what foot provides, by GPT
    printf '\e]7;file://%s%s\e\\' "$HOSTNAME" "$PWD"
}

__update_title() {
    printf '\033]0;%s\007' "$PWD"
}

PS0+=$'\e]133;C\e\\'

PROMPT_COMMAND+=(
    __osc133_precmd
    __osc7_cwd
    __update_title
    __osc133_postcmd
)

# ------------
# Shell prompt
# ------------

if [[ -r /usr/share/git/git-prompt.sh ]]; then
    source /usr/share/git/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUPSTREAM='auto'
fi

PS1='\[\e[38;2;104;168;228m\]\u@\h \
\[\e[38;2;145;126;107m\]\w\
\[\e[38;2;224;44;109m\]$(__git_ps1 " (%s)") \
\[\e[38;2;81;159;80m\]\$ \
\[\e[0m\]'

# ----------
# CP helpers
# ----------

ccmp() {
    local name="${1%.*}"
    g++ "$1" -Wshadow -Wall -Wextra ${2:+$2} -std=c++20 -O2 -o "${name}.out" || {
        printf '\e[31mCompilation failed <:\e[0m\n'
        return 1
    }
}

cpgo() {
    local name="${1%.*}"
    ccmp "$1" "$2" && ./"${name}.out"
}

# ----
# Misc
# ----

# this probably fixed something with tmux
if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
