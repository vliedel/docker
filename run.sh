sudo docker run -e XMPP_NAMESERVER_USERNAME=$DODEDODO_USERNAME -e XMPP_NAMESERVER_PASSWORD=$DODEDODO_PASSWORD -e XMPP_NAMESERVER_RESOURCE=$DODEDODO_RESOURCE -e AIM_WORKSPACE=/aim_workspace  -i --privileged -v /dev/rfxcom:/dev/rfxcom -t dobots/aim_dodedodo bash