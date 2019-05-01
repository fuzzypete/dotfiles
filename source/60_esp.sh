export ESP_DEV=true
export ESP_ENV=DEV
export ESP_PREPROD=true
#export ESP_EDI_OUTFOLDER=/mnt/hgfs/dev/prod/outgoing/edi
export ESP_USE_DECIMAL128=true

export ESP_ROOT=$GOPATHROOT/src/verity/esp
export ESPUI_ROOT=$GOPATHROOT/src/verity/espui
export ESP_SERVICE_STATIC_PATH=$ESPUI_ROOT/build

export ESP_DB_NAME=esp
export ESP_DB_SERVERS=localhost:27017
export ESP_DB_USER=espuser
export ESP_DB_PASSWORD=esppwd

export ESP_LOG_TTY=true
export ESP_LOG_LEVEL=INFO

export ESP_UMSMTP_SERVER=localhost:5555
export ESP_UMSMTP_FROM=pwickersham@verity340b.com
export ESP_UMSMTP_DEBUG=false

export ESP_SMTP_SERVER=localhost:5555
export ESP_SMTP_TO=pwickersham@verity340b.com
export ESP_SMTP_FROM=pwickersham@verity340b.com

export QA_BASE_ACCE_ID=1
export QA_ACTIVE_CES=2
export QA_BASE_ACPH_ID=1
export QA_ACTIVE_PHS=3
export QA_VENDOR_NICKNAME=MCKESSON
export QA_RANDOM_SEED=42

export QA_REFDATA_FOLDER=/srv/esp/qa/refdata
export QA_IMPORT_FOLDER=/srv/esp/qa/import

setEspDbName() {
    export ESP_DB_NAME=$1
}

alias esptty='export ESP_LOG_TTY=true'
alias espfil='export ESP_LOG_TTY=false'
alias espinf='export ESP_LOG_LEVEL=INFO'
alias espdbg='export ESP_LOG_LEVEL=DEBUG'

alias rmlogs='find . -name "*.log" -not -path "*/esp/vendor/*" -exec rm {} \; -print'
alias buildesp='find /home/pwickersham/go/src/verity/esp -name main.go -not -path "*/esp/vendor/*" -execdir go build \; -print'
alias cleanesp='find /home/pwickersham/go/src/verity/esp -name main.go -not -path "*/esp/vendor/*" -execdir go clean \; -print'

alias cleandb='mongo $ESP_DB_NAME --eval "db.dropDatabase()";mongo esp $ESP_ROOT/tools/db/indexes/*.js'
alias dropdb='mongo $ESP_DB_NAME --eval "db.dropDatabase()";'
alias cleanqa='find /srv/esp/qa -name "*.txt" -exec rm {} \; -print'
alias cleantest='mongo esptest --eval "db.dropDatabase()";mongo esptest $ESP_ROOT/tools/db/indexes/*.js'

alias getlkg='scp -r jenkins@10.1.1.21:/var/lib/jenkins/jobs/code/test/results/lkgdb ~/mongo/backups'
alias esptest='setEspDbName esptest'
#alias espdev='export ESP_MONGODB_URL=mongodb://localhost:27017/esp'
#alias espdev='export ESP_DB_NAME=esp'
alias espdev='setEspDbName esp'
#alias espgc='export ESP_MONGODB_URL=mongodb://localhost:27017/esptest;goconvey;unset ESP_MONGODB_URL'
alias espgc='OLD_DB=$ESP_DB_NAME; echo $OLD_DB ; export ESP_DB_NAME=esptest;goconvey -excludedDirs ".git,vendor,thirdparty,mappings,db";ESP_DB_NAME=$OLD_DB'
alias espgcclean='OLD_DB=$ESP_DB_NAME; echo $OLD_DB ; cleantest ; export ESP_DB_NAME=esptest;goconvey -excludedDirs ".git,vendor,thirdparty,mappings,db";ESP_DB_NAME=$OLD_DB'
alias gtest='OLD_DB=$ESP_DB_NAME; echo $OLD_DB ; export ESP_DB_NAME=esptest;go test ./... | egrep -v "no test files" | egrep -v "(cached)";ESP_DB_NAME=$OLD_DB'
#alias gtest="go test ./... | egrep -v 'no test files' | egrep -v '(cached)'"
alias espdb=setEspDbName
