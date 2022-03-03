FROM alpine:3.12
MAINTAINER Michael buluma

LABEL Description="Bash Tools"

# used by build.sh to figure out which repo to bootstrap
ENV PATH $PATH:/github/bash-tools

ADD https://raw.githubusercontent.com/HariSekhon/DevOps-Bash-tools/master/setup/docker_bootstrap.sh /build.sh

RUN chmod +x /build.sh && NO_TESTS=1 /build.sh

# Cache Bust upon new commits
ADD https://api.github.com/repos/HariSekhon/DevOps-Bash-tools/git/refs/heads/master /.git-hashref

ADD https://raw.githubusercontent.com/HariSekhon/Dockerfiles/master/src/list_shell.sh /list.sh

# 2nd run is almost a noop without cache, and only an incremental update upon cache bust
RUN chmod +x /list.sh && /build.sh

WORKDIR /github/bash-tools

CMD ["/list.sh", "/github/bash-tools"]
