#
#  Author: Hari Sekhon
#  Date: 2016-01-16 09:58:07 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:et
#
#  https://github.com/harisekhon/Dockerfiles
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help improve or steer this or other code I publish
#
#  https://www.linkedin.com/in/harisekhon
#

FROM alpine:3.12
MAINTAINER Hari Sekhon (https://www.linkedin.com/in/harisekhon)

LABEL Description="Alpine Java (OpenJDK)"

ARG JAVA_VERSION=8
ARG JAVA_RELEASE=JDK

RUN set -eux && \
    pkg="openjdk$JAVA_VERSION" && \
    if [ "$JAVA_RELEASE" != "JDK" ]; then \
        pkg="$pkg-jre"; \
    fi && \
    apk add --no-cache $pkg

COPY profile.d/java.sh /etc/profile.d/

ENV JAVA_HOME=/usr

CMD ["/bin/sh"]
