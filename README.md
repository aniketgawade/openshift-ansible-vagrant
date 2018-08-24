### openshift-ansible-vagrant

Steps:
  1. Install virtualbox on your machine.
  2. Make you default interface as linux bridge or you can set private ip in Vagrant file.
  2. Run "vagrant up".
  3. ssh first node(master) setup ssh-keys and /etc/hosts.
  4. ip route del default dev enp0s3 # so that defaut interface is not vagrant ip
  5. cd into openshift-ansible and fill up ose-install and then run 
     ```
     ansible-playbook -i inventory/ose-install playbooks/prerequisites.yml 
     ansible-playbook -i inventory/ose-install playbooks/deploy_cluster.yml
     ```

  
