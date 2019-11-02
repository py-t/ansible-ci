FROM alpine:3.8

RUN apk add --no-cache python3 python3-dev gcc musl-dev libffi-dev make openssl-dev git openssh-client && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip setuptools && \
    pip3 install ansible==2.8.* yamllint pywinrm && \
    pip3 install cs && \
    mkdir -p /root/.ssh && \
    echo "StrictHostKeyChecking no" > /root/.ssh/config && \
    mkdir -p /root/.config/yamllint

COPY yamllint_config /root/.config/yamllint/config
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
