FROM vialink/vlk-ubuntu-zatio

ARG USER=admin
ARG PASS=admin
ARG NAME=zatio
ARG NAME_PROJECT=zatio_demo
ARG USER_LOCAL=userzatio

ENV USERNAME=${USER}
ENV PASSWORD=${PASS}
ENV NAME=${NAME}
ENV PROJECT_NAME=${NAME_PROJECT}
ENV LOCAL_USERNAME=${USER_LOCAL}
ENV BASE_DIR='/var/www'

ENV DB_ZATIO_USER=''
ENV DB_ZATIO_PASSWD=''
ENV DB_ZATIO_HOST='localhost'
ENV DB_ZATIO_PORT=3306

RUN mkdir -p ${BASE_DIR}/${NAME}/{logs,backups,versoes_coletor}

WORKDIR $BASE_DIR/$NAME/

RUN git clone https://${USERNAME}:${PASSWORD}@gitlab.vialink.com.br/zatio/zatio.git build

WORKDIR $BASE_DIR/$NAME/build

ADD start.sh $BASE_DIR/$NAME/build/start.sh

RUN git checkout docker

EXPOSE 80 443

ENTRYPOINT [ "bash", "./start.sh" ] 