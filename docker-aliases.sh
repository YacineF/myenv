# Docker aliases
alias docker-killall='docker kill $(docker ps -q)'
alias docker-rmall='docker rm $(docker ps -a -q)'
alias docker-recompose='docker-killall; docker-rmall; docker compose up -d'
alias dps='docker ps'
function docker-bash(){
        docker exec -it "$1" /bin/bash
}


function _dock-bash(){
        while read line; do
                compadd $line
        done < <(docker ps --format '{{.Names}}')

}
compdef _dock-bash docker-bash
