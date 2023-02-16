alias ec='emacsclient -n'
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
alias k='kubectl'
alias lh='ls -alh'
alias lr='ls -haltr'

function cs() {
	cd $1 && ls
}
function cl() {
	cd $1 && ll
}
function up() {
	cd ../
}

