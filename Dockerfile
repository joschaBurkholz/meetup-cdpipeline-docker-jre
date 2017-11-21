FROM centos:7.2.1511

MAINTAINER Joscha Burkholz <joscha.burkholz@mgx.de>

ENV JAVA_OPTS "$JAVA_OPTS -Duser.country=DE -Duser.language=de -Duser.timezone=Europe/Berlin"

# User root user to install software
USER root

RUN INSTALL_PKGS="java-1.8.0-openjdk.x86_64" && \
    yum -y --setopt=tsflags=nodocs install $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all  && \
    localedef -f UTF-8 -i en_US en_US.UTF-8

# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0
