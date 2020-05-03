# get current status of git repo
function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf "-"; return; else printf "["; fi
  if echo ${STATUS} | grep -c "renamed:"         &> /dev/null; then printf ">"; else printf ""; fi
  if echo ${STATUS} | grep -c "branch is ahead:" &> /dev/null; then printf "!"; else printf ""; fi
  if echo ${STATUS} | grep -c "new file::"       &> /dev/null; then printf "+"; else printf ""; fi
  if echo ${STATUS} | grep -c "Untracked files:" &> /dev/null; then printf "?"; else printf ""; fi
  if echo ${STATUS} | grep -c "modified:"        &> /dev/null; then printf "*"; else printf ""; fi
  if echo ${STATUS} | grep -c "deleted:"         &> /dev/null; then printf "-"; else printf ""; fi
  printf "]"
}

parse_git_branch() {
  # Long form
  # git rev-parse --abbrev-ref HEAD 2> /dev/null
  # Short form
  git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -e 's/.*\/\(.*\)/\1/'
}

__export_ps1() {
  export PS1="\n[\033[32m\]\w\033[00m\]] (\033[33m\]\$(parse_git_branch)\[\033[31m\]\$(parse_git_dirty)\[\033[00m\]) λ "
}
__export_ps1
PROMPT_COMMAND='__export_ps1'
