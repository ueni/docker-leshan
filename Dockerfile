FROM arm32v7/openjdk:8-jre-alpine

LABEL maintainer="ueni, ueniueni"

COPY qemu-arm-static /usr/bin

RUN mkdir -p /opt/leshan
RUN adduser -S -h /opt/leshan -s /sbin/nologin leshan

ADD https://hudson.eclipse.org/leshan/job/leshan/lastSuccessfulBuild/artifact/leshan-server-demo.jar /opt/leshan/
ADD https://hudson.eclipse.org/leshan/job/leshan/lastSuccessfulBuild/artifact/leshan-bsserver-demo.jar /opt/leshan/
ADD https://hudson.eclipse.org/leshan/job/leshan/lastSuccessfulBuild/artifact/leshan-client-demo.jar /opt/leshan/

EXPOSE 5683 5684 8080

ADD start.sh /opt/leshan/

RUN chown -R leshan:nogroup /opt/leshan
USER leshan
WORKDIR /opt/leshan
ENTRYPOINT ["/opt/leshan/start.sh"]

