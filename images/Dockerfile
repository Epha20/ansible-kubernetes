FROM lvzhenjiang/ansible-kubernetes:v1.20.9

COPY hosts /etc/ansible/hosts
RUN chmod 744 /etc/ansible/hosts
COPY --chmod=777 ansible.cfg /etc/ansible/ansible.cfg
COPY dev /etc/ansible/dev
RUN chmod 744 /etc/ansible/dev
COPY --chmod=777 playbooks/hbase_test2.yaml ./hbase_test2.yaml
