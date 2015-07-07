#########
# Jenkins
#########

FROM jenkins:1.609.1

USER root

############
# Oracle JDK
############

ENV VERSION 7u80
ENV BUILD 15
ENV JAVA_HOME /etc/jdk-${VERSION}-b${BUILD}

RUN cd /tmp
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${VERSION}-b${BUILD}/jdk-${VERSION}-linux-x64.tar.gz
RUN mkdir jdk-${VERSION}-linux-x64
RUN tar -zxvf jdk-${VERSION}-linux-x64.tar.gz --directory jdk-${VERSION}-linux-x64 --strip-components=1
RUN mv jdk-${VERSION}-linux-x64 ${JAVA_HOME}

ENV PATH ${PATH}:${JAVA_HOME}/bin

# Testing
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
