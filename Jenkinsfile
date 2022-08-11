pipeline {
  agent any

  stages {
    stage('Run Ansible Playbooks') {
      when {
        changeset 'playbooks/*'
      }

      steps {
        sshagent(['ansible_ssh_key']) {
          sh 'ssh -o StrictHostKeyChecking=no -l ubuntu ANSIBLE_IP wget https://raw.githubusercontent.com/sethusaim/Ansible-AWS-Demo/main/run_ansible.sh'

          sh 'ssh -o StrictHostKeyChecking=no -l ubuntu ANSIBLE_IP bash run_ansible.sh'
        }
      }
    }

    stage('Plan and Apply new infrastrucuture') {
      when {
        changeset 'infrastructure/*'
      }
      
      steps {
        script {
          sh 'terraform -chdir=infrastructure init'

          sh 'terraform -chdir=infrastructure apply --auto-approve'
        }
      }
    }
  }