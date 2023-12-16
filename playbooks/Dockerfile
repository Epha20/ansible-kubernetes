# Use a base image
FROM mdc1-sfcr.safaricomet.net/bigdata/kubectl:40

# Copy hosts file
COPY hosts /etc/ansible/hosts
RUN chmod 744 /etc/ansible/hosts

# Copy and configure ansible.cfg
COPY --chmod=777 ansible.cfg /etc/ansible/ansible.cfg

# Copy dev directory
COPY dev /etc/ansible/dev
RUN chmod 744 /etc/ansible/dev

# Copy hbase_test2.yaml playbook
COPY --chmod=777 playbooks/hbase_test2.yaml ./hbase_test2.yaml

# Install kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

# Install Minikube
RUN curl -LO "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64" && \
    chmod +x ./minikube-linux-amd64 && \
    mv ./minikube-linux-amd64 /usr/local/bin/minikube

# Set environment variables
ENV HOME /root

# Start Minikube
CMD ["minikube", "start", "--driver=docker"]
