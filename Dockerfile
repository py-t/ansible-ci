FROM python:3.9-buster

RUN pip3 install --upgrade pip setuptools && \
    pip3 install ansible~=4.0 yamllint molecule && \
    pip3 install cs hcloud && \
    mkdir -p /root/.ssh && \
    echo "StrictHostKeyChecking no" > /root/.ssh/config && \
    mkdir -p /root/.config/yamllint

COPY yamllint_config /root/.config/yamllint/config
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
