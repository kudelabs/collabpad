FROM java:7-jdk

# Update for new versions
ENV SCALA_VERSION 2.11.7
ENV SBT_VERSION 0.13.8

# Scala
RUN curl -O -L http://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz
RUN tar xzvf scala-${SCALA_VERSION}.tgz
RUN rm scala-${SCALA_VERSION}.tgz

ENV SCALA_HOME /scala-${SCALA_VERSION}
ENV SCALA_LIBRARY_JAR /scala-${SCALA_VERSION}/lib/scala-library.jar
ENV PATH ${SCALA_HOME}/bin:$PATH
ENV JAVA_OPTS "-Xbootclasspath/p:../infrastructure/lib/rhino-js-1.7r3.jar:$SCALA_LIBRARY_JAR -Xmx1024M -Xms1024M"
ENV JAVA "/usr/bin/java"

RUN mkdir /app
ADD . /app/

WORKDIR /app
RUN /app/bin/build.sh

EXPOSE 9000

CMD ["/app/bin/run.sh"]