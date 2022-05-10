# Aliases
export MYROOT="${HOME}/myapps/myutils"

alias j="jtoday default"
alias je="jentry default"
alias js="jsearch default"
alias jd="jdoc default"
alias jl="jlist default"
alias jdl="jdlist default"

alias jf="jtoday flipp"
alias jfe="jentry flipp"
alias jfs="jsearch flipp"
alias jfd="jdoc flipp"
alias jfl="jlist flipp"
alias jfdl="jdlist flipp"

# Functions
function jtoday() {
  jrnl=$1
  dy="${@:2}"
  dstr=$(gdate --date="$dy" +"%Y/%b")
  the_file=$(gdate --date="$dy" +"%d")
  root_dir="${HOME}/Dropbox/jrnl/$jrnl"
  the_dir=$root_dir/$dstr
  mkdir -p $the_dir
  the_file=$the_dir/$the_file.md
  echo $the_file
  vi $the_file
}

function jentry() {
  jrnl=$1
  comment="${@:2}"
  dy="today"
  dstr=$(gdate --date="$dy" +"%Y/%b")
  the_file=$(gdate --date="$dy" +"%d")
  root_dir="${HOME}/Dropbox/jrnl/$jrnl"
  the_dir=$root_dir/$dstr
  mkdir -p $the_dir
  the_file=$the_dir/$the_file.md
  echo $the_file
  echo $comment >>$the_file
}

function jsearch() {
  jrnl=$1
  ndays=$2
  tag=$3
  root_dir="${HOME}/Dropbox/jrnl/$jrnl"
  for i in {0..$ndays}; do
    date_part=$(gdate --date="$i day ago" +%Y/%b/%d)
    dfile="${root_dir}/${date_part}.md"
    grep -his $tag $dfile
  done
}

function jdoc() {
  jrnl=$1
  the_file=$2
  root_dir="${HOME}/Dropbox/jrnl/$jrnl/docs"
  the_file=$root_dir/$the_file.md
  echo $the_file
  vi $the_file
}

function jdlist() {
  jrnl=$1
  the_file=$2
  root_dir="${HOME}/Dropbox/jrnl/$jrnl/docs"
  find $root_dir
}
function jlist() {
  jrnl=$1
  the_file=$2
  root_dir="${HOME}/Dropbox/jrnl/$jrnl"
  find $root_dir
}

# Settings
export EDITOR="vi"
export GITHUB_TOKEN="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"
export PROMPT_EOL_MARK=""
# export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES


# Path Settings
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

#export PATH="./:${PATH}:${HOME}/flipp/apps/kafka_2.11-2.0.1/bin"
export PATH="./:${PATH}:${HOME}/Library/Python/3.8/bin:$MYHOME/gtasks:${HOME}/myapps/contrib/k9s/execs"

# Oh My Zsh Settings
ZSH_THEME="spaceship"

plugins=(
  zsh-syntax-highlighting
  git
  terraform
  zsh-autosuggestions
  zsh-completions
  terraform
  kubectl
  aws
  ansible
  common-aliases
  docker
  gcloud
  helm
  gh
  jenv
  jira
  macos
)

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

## Load autocompletions
autoload -U compinit
compinit

## Start Oh My Zsh
export ZSH="${HOME}/.oh-my-zsh"
source ${ZSH}/oh-my-zsh.sh

# Start up
set -o vi
cd ${HOME}/flipp/apps
alias t=terraform
clear
cat "${HOME}/manish.txt" | lolcat

