pipeline {
  agent any

  stages {
    stage('Run Ansible Playbooks') {
      when {
        changeset 'playbooks/*'
      }

      steps {
        script {
          sh 'sudo ansible-playbook playbooks/main.yml'
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