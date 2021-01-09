#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
#set -o xtrace

# Load libraries
. /opt/bitnami/scripts/libbitnami.sh
. /opt/bitnami/scripts/libcassandra.sh

# Load Cassandra environment variables
eval "$(cassandra_env)"

print_welcome_page

if [[ "$*" = *"/opt/bitnami/scripts/cassandra/run.sh"* || "$*" = "/run.sh" ]]; then
    info "** Starting Cassandra setup **"
    /opt/bitnami/scripts/cassandra/setup.sh
    info "** Cassandra setup finished! **"
fi

for f in docker-entrypoint-initdb.d/*; do
    case "$f" in
        *.sh)     echo "$0: running $f"; . "$f" ;;
        *.cql)    echo "$0: running $f" && until cqlsh localhost 9042 -u cassandra -p cassandra -f "$f"; do >&2 echo "Cassandra is unavailable - sleeping"; sleep 2; done & ;;
        *)        echo "$0: ignoring $f" ;;
    esac
    echo
done

echo ""
exec "$@"
