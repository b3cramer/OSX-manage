#!/bin/bash

curl -o /tmp/jumpcloud-agent.pkg "https://s3.amazonaws.com/jumpcloud-windows-agent/production/jumpcloud-agent.pkg"
mkdir -p /opt/jc
cat <<-EOF > /opt/jc/agentBootstrap.json
{
"publicKickstartUrl": "https://kickstart.jumpcloud.com:443",
"privateKickstartUrl": "https://private-kickstart.jumpcloud.com:443",
"connectKey": "3602aca964f63e8412588cceecaf12d512460488"
}
EOF
installer -pkg /tmp/jumpcloud-agent.pkg -target /
