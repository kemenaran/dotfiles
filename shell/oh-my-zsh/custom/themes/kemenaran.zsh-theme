# Robbyrussel theme, with added jj prompt (if available)

_kemenaran_vcs_info() {
  # If the git prompt disappears, try `zstyle ':omz:alpha:lib:git' async-prompt 0`
  jj_prompt_template_raw "surround('$ZSH_THEME_JJ_PROMPT_PREFIX', '$ZSH_THEME_JJ_PROMPT_SUFFIX', self.change_id().shortest(3))" \
  || git_prompt_info
}

PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(_kemenaran_vcs_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

ZSH_THEME_JJ_PROMPT_PREFIX="%{$fg_bold[blue]%}jj:(%{$fg[red]%}"
ZSH_THEME_JJ_PROMPT_SUFFIX="%{$reset_color%}) "
