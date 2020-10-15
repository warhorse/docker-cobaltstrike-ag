#!/bin/bash
#
#
#
PORT="50050"
USER="ag-script"

cd /opt/cobaltstrike
token=`curl -s https://www.cobaltstrike.com/download -d "dlkey=${COBALTSTRIKE_KEY}" | grep 'href="/downloads/' | cut -d '/' -f3`
curl -s https://www.cobaltstrike.com/downloads/${token}/cobaltstrike-dist.tgz -o /tmp/cobaltstrike.tgz
tar zxf /tmp/cobaltstrike.tgz -C /opt
echo $COBALTSTRIKE_KEY > ~/.cobaltstrike.license
/opt/cobaltstrike/update
/opt/cobaltstrike/agscript ${COBALTSTRIKE_HOSTNAME} $PORT $USER ${COBALTSTRIKE_PASS} /opt/cobaltstrike/scripts/${AG_SCRIPT_NAME}
