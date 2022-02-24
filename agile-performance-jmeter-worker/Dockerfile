# inspired by https://github.com/hauptmedia/docker-jmeter  and
# https://github.com/hhcordero/docker-jmeter-server/blob/master/Dockerfile
FROM alpine:3.12

ARG JMETER_VERSION="5.4.3"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV	JMETER_BIN	${JMETER_HOME}/bin
ENV	JMETER_DOWNLOAD_URL  https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

# Install extra packages
# Set TimeZone, See: https://github.com/gliderlabs/docker-alpine/issues/136#issuecomment-612751142
ARG TZ="UTC"
ENV TZ ${TZ}
RUN    apk update \
  && apk upgrade \
  && apk add ca-certificates \
  && update-ca-certificates \
  && apk add --update openjdk8-jre tzdata curl unzip bash \
  && apk add --no-cache nss \
  && rm -rf /var/cache/apk/* \
  && mkdir -p /tmp/dependencies  \
  && curl -L --silent ${JMETER_DOWNLOAD_URL} >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz  \
  && mkdir -p /opt  \
  && tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt  \
  && rm -rf /tmp/dependencies

# TODO: plugins (later)
# && unzip -oq "/tmp/dependencies/JMeterPlugins-*.zip" -d $JMETER_HOME

# # Set global PATH such that "jmeter" command is found
# ENV PATH $PATH:$JMETER_BIN

# # Entrypoint has same signature as "jmeter" command
# COPY entrypoint.sh /

WORKDIR	${JMETER_HOME}

#ENTRYPOINT ["/entrypoint.sh"]

# # Ports required for JMeter Slaves/Server
EXPOSE 1099 50000

# # Application to be executed to start the JMeter container
ENTRYPOINT $JMETER_HOME/bin/jmeter-server \
                        -Dserver.rmi.localport=50000 \
                        -Dserver_port=1099


# #This Dockerfile builds Apache JMeter Master Executable based on ajeetraina/apache-jmeter-base

# FROM ajeetraina/apache-jmeter-base
# LABEL Description="This image is used to start the Apache JMeter Server Executable" Vendor="Collabnix" Version="1.0"

# # Ports required for JMeter Slaves/Server
# EXPOSE 1099 50000

# # Application to be executed to start the JMeter container
# ENTRYPOINT $JMETER_HOME/bin/jmeter-server \
#                         -Dserver.rmi.localport=50000 \
#                         -Dserver_port=1099
