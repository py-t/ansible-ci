FROM python:3.9-buster

RUN curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null &&
    apt-get install apt-transport-https --yes &&
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list &&
    apt-get update &&
    apt-get install helm
RUN pip3 install --upgrade pip setuptools && \
    pip3 install ansible~=5.4 yamllint ansible-lint molecule~=3.6 molecule-hetznercloud requests netaddr kubernetes && \
    pip3 install cs hcloud && \
    mkdir -p /root/.ssh && \
    echo "StrictHostKeyChecking no" > /root/.ssh/config && \
    mkdir -p /root/.config/yamllint

COPY yamllint_config /root/.config/yamllint/config
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
