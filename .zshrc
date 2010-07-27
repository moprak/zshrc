# Prakash Mohan's .zshrc
# Complied from the man pages and lots of others's zshrcs
# Note, this zshrc is split into mutiple files (placed under a .zsh_files
# dirctory) for better readability


setopt autocd # Automatically cd when a path is given
unsetopt beep    # No beeps please!
setopt correct # correct commands
setopt correctall # correct all the words in the command line
setopt ALL_EXPORT

## HISTORY STUFF
setopt appendhistory
setopt histreduceblanks
setopt histignorespace
setopt histignorealldups
setopt histverify               # when using ! cmds, confirm first
setopt SHARE_HISTORY            # share history between open shells
setopt INC_APPEND_HISTORY       # append history as command are entered
setopt HIST_NO_STORE            # don't save 'history' cmd in history
setopt EXTENDED_HISTORY         # add timestamps to history
setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups # push directories visited automatically onto stack

## COMPLETION STUFF
setopt automenu # Automatically use menu completion after the second consecutive request for completion, for example by pressing the TAB key repeatedly
setopt MENUCOMPLETE
setopt autolist                 # Filename Completion
setopt listpacked               # compact completion lists
setopt longlistjobs
setopt extendedglob             # weird & wacky pattern matching - yay zsh!
setopt nolisttypes              # show types in completion
setopt completeinword           # not just at the end
setopt alwaystoend              # when complete from middle, move cursor
setopt MARK_DIRS                # adds slash to end of completed dirs
setopt globdots                 # find dotfiles easier
setopt NUMERIC_GLOB_SORT
setopt nomatch
setopt notify
unsetopt COMPLETE_IN_WORD # move to end of the word after completition
unsetopt autoparamslash

setopt SH_WORD_SPLIT # passes "foo bar" as "foo" "bar" to commands. Backward compatibility with sh/ksh
setopt cdablevars               # avoid the need for an explicit $
setopt nopromptcr               # don't add \n which overwrites cmds with no \n
unsetopt promptcr
setopt interactivecomments      # escape commands so i can use them later
setopt recexact
setopt rcquotes
setopt HASH_CMDS
setopt HASH_DIRS
setopt clobber      # > and >> will work as expected.

# Background proccesses
unsetopt BG_NICE                # Don't nice background process
setopt nohup                    # don't kill background on logout
setopt autoresume
setopt AUTO_CONTINUE

unsetopt RM_STAR_SILENT #  Warn before rm * or rm path/*

# I don't want glob in some specific cases
for com in alias expr find mattrib mcopy mdir mdel which;
alias $com="noglob $com"

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

## Useful Keybindings
bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand

## Source my Exports
if [[ -f $HOME/.zsh_files/exports ]]; then
    source $HOME/.zsh_files/exports
fi

## Source my Aliases
if [[ -f $HOME/.zsh_files/aliases ]]; then
    source $HOME/.zsh_files/aliases
fi

## Source my custom functions
if [[ -f $HOME/.zsh_files/functions ]]; then
    source $HOME/.zsh_files/functions
fi

## Create a nice prompt
if [[ -f $HOME/.zsh_files/prompt ]]; then
    source $HOME/.zsh_files/prompt
fi

## Source the Completion stuff
if [[ -f $HOME/.zsh_files/completition ]]; then
    source $HOME/.zsh_files/completition
fi

## KDE Development

source $HOME/.cd-function
