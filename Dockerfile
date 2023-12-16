FROM lvzhenjiang/ansible-kubernetes:v1.20.9

# Install curl and ca-certificates (if not already installed)
RUN apt-get update && apt-get install -y curl ca-certificates

# Download and install kubectl binary
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/bin/
COPY hosts /etc/ansible/hosts
RUN chmod 744 /etc/ansible/hosts
COPY --chmod=777 ansible.cfg /etc/ansible/ansible.cfg
COPY dev /etc/ansible/dev
RUN chmod 744 /etc/ansible/dev
COPY --chmod=777 playbooks/hbase_test2.yaml ./hbase_test2.yaml
COPY --chmod=777 playbooks/hbase_test0.yaml ./hbase_test0.yaml

