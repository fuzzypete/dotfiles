export GOPATHROOT=$HOME/go
export GOPATH=$GOPATHROOT
export PATH
PATH="$(path_remove /usr/local/bin):/usr/local/bin"
PATH="$(path_remove /usr/local/go/bin):/usr/local/go/bin"
PATH="$(path_remove $GOPATHROOT/bin):$GOPATHROOT/bin"
PATH="$(path_remove $HOME/bin):$HOME/bin"
PATH="$(path_remove $HOME/src/FlameGraph):$HOME/src/FlameGraph"
#PATH=$PATH:/usr/local/bin:/usr/local/go/bin:$GOPATHROOT/bin:$HOME/bin
