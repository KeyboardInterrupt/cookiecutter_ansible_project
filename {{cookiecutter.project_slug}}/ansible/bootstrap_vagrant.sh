#!/usr/bin/env bash
#
# Author: KeyboardInterrupt
# Date: 21.01.2018
#
# This Script sets up and bootstraps a Vagrant Environment for tc-angular

main() {
  ansible-galaxy install -r requirements.yml -p roles
  export BOOTSTRAP_VAGRANT=True
  vagrant up
  vagrant provision
  ln -s  ../../.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory inventories/vagrant/hosts
  ansible-playbook site.yml -i inventories/vagrant/hosts
}

main ${@}
