FROM python:3.9-buster

RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
RUN pip3 install --upgrade pip setuptools && \
    pip3 install ansible~=5.4 yamllint ansible-lint molecule~=3.6 molecule-hetznercloud requests netaddr kubernetes && \
    pip3 install cs hcloud && \
    mkdir -p /root/.ssh && \
    echo "StrictHostKeyChecking no" > /root/.ssh/config && \
    mkdir -p /root/.config/yamllint

COPY yamllint_config /root/.config/yamllint/config
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
