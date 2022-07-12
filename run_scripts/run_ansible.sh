#!bin/bash

cat ansible_hosts.txt > etc/ansible/hosts

sudo ansible-playbook playbooks/test.yml