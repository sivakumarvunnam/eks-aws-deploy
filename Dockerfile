FROM alpine:latest
LABEL maintainer="Sivakumar Vunnam"
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.21.11/bin/linux/amd64/kubectl \
             && chmod u+x kubectl \
             && mv kubectl /usr/bin/kubectl
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
