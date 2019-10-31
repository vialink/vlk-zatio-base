FROM vialink/vlk-ubuntu-zatio

ARG USER=admin
ARG PASS=admin
ARG NAME=zatio
ARG NAME_PROJECT=zatio_demo
ARG USER_LOCAL=userzatio

ENV USERNAME={$USER}
ENV PASSWORD={$PASS}
ENV NAME={$NAME}
ENV PROJECT_NAME={$NAME_PROJECT}
ENV LOCAL_USERNAME={$USER_LOCAL}

WORKDIR /root

RUN git clone https://${USERNAME}:${PASSWORD}@gitlab.vialink.com.br/zatio/zatio.git 

WORKDIR ./zatio

RUN git checkout docker

EXPOSE 80 443

ENTRYPOINT [ "bash", "/root/zatio/start.sh" ] 
