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

RUN apt-get purge -y openjdk-8-jre
RUN cd /tmp
RUN apt-get update && apt-get install ca-certificates curl -y
RUN curl --silent --location --retry 3 --cacert /etc/ssl/certs/GeoTrust_Global_CA.pem \
    --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
    http://download.oracle.com/otn-pub/java/jdk/"${VERSION}"u"${UPDATE}"-b"${BUILD}"/jdk-"${VERSION}"u"${UPDATE}"-linux-x64.tar.gz \
    | tar xz -C /tmp && mv /tmp/jdk1.${VERSION}.0_${UPDATE} "${JAVA_HOME}"

ENV PATH ${PATH}:${JAVA_HOME}/bin
RUN java -version
RUN javac -version

#######
# Maven
#######

ENV MAVEN_VERSION 3.2.3
ENV MAVEN_HOME /opt/maven

RUN curl -sSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /tmp
RUN mv /tmp/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME}

ENV PATH ${PATH}:${MAVEN_HOME}/bin
RUN mvn -version

#####
# Ant
#####

ENV ANT_VERSION 1.9.5
ENV ANT_HOME /opt/ant

RUN cd /tmp
RUN wget -q http://www.us.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz
RUN tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz
RUN mv apache-ant-${ANT_VERSION} ${ANT_HOME}
RUN rm apache-ant-${ANT_VERSION}-bin.tar.gz

ENV PATH ${PATH}:${ANT_HOME}/bin
RUN ant -version
