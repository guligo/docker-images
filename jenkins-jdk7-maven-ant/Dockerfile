#########
# Jenkins
#########

FROM jenkins:1.609.1

USER root

############
# Oracle JDK
############

ENV VERSION 7
ENV UPDATE 80
ENV BUILD 15

ENV JAVA_HOME /etc/java-${VERSION}.${UPDATE}.${BUILD}-jdk

RUN apt-get update && apt-get install ca-certificates curl -y && \
    curl --silent --location --retry 3 --cacert /etc/ssl/certs/GeoTrust_Global_CA.pem \
    --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
    http://download.oracle.com/otn-pub/java/jdk/"${VERSION}"u"${UPDATE}"-b"${BUILD}"/jdk-"${VERSION}"u"${UPDATE}"-linux-x64.tar.gz \
    | tar xz -C /tmp && mv /tmp/jdk1.${VERSION}.0_${UPDATE} "${JAVA_HOME}" && \
    apt-get autoclean && apt-get --purge -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN update-alternatives --install "/usr/bin/java" "java" "${JAVA_HOME}/bin/java" 1 && \
    update-alternatives --install "/usr/bin/javaws" "javaws" "${JAVA_HOME}/bin/javaws" 1 && \
    update-alternatives --install "/usr/bin/javac" "javac" "${JAVA_HOME}/bin/javac" 1 && \
    update-alternatives --set java "${JAVA_HOME}/bin/java" && \
    update-alternatives --set javaws "${JAVA_HOME}/bin/javaws" && \
    update-alternatives --set javac "${JAVA_HOME}/bin/javac"

#######
# Maven
#######

ENV MAVEN_VERSION 3.2.3

ENV MAVEN_HOME /opt/maven

RUN curl -sSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /tmp \
  && mv /tmp/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME} \
  && ln -s ${MAVEN_HOME}/bin/mvn /usr/bin/mvn

#####
# Ant
#####

ENV ANT_VERSION 1.9.5

ENV ANT_HOME /opt/ant

RUN cd && \
    wget -q http://www.us.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mv apache-ant-${ANT_VERSION} ${ANT_HOME} && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz

ENV PATH ${PATH}:${ANT_HOME}/bin
