# Ansible-AWS-Demo

## Prerequisites 
- Having an AWS account
- Create a user with admin access (use only if your using your own personal account)
- Create a pem file for ssh access
- Install terraform locally 
- Install awscli and configure your creds


### Create the infrastructure using Terraform
Make sure that terraform is properly installed in local system. The code to run terraform scripts can be found in the infrastructure folder. Before we run the terraform scripts, we have to set the terraform to S3 bucket so that the terraform state file, does not remain in local, and it is somewhere secure.

#### Create terraform state bucket
To create the terraform state bucket, follow the steps
-  Go to the S3 console, and click on the create bucket
-  Choose the bucket name (make sure it is unique) (Eg - tf-state-YOUR_NAME)
- Scroll down and till you find Bucket Versioning, and click on enable, and finally click on create bucket
- On successfully execution , bucket will be created in which bucket and objects are not public. (Have to private because of security)

Grab the bucket name which was created, and go to module.tf and replace it with YOUR_TF_BUCKET_NAME, and also YOUR_AWS_REGION with your AWS region.

Now run the following commands to create the infrastructure

```bash
terraform -chdir=infrastructure init
```
This command will initialize the terraform modules and install required packages

```bash
terraform -chdir=infrastructure apply --auto-approve
```
This command will launch 2 EC2 instances, t2.medium (Ansible Server) and t2.micro (Apache) instances. After some time we shall see that 2 EC2 instances are up and running.

Connect to the Application Server EC2 using ssh, by MobaXTerm,Putty or any ssh client tool. Once the connection is done. Run the following commands

```bash
sudo nano YOUR_PEM_FILE_NAME.pem
```
Remember to keep YOUR_PEM_FILE_NAME as same the one created earlier.

Open a terminal and locate your pem file and run

```bash
cat YOUR_PEM_FILE_NAME.pem
```
Copy the contents of the file and paste it in the file where ssh connection has been made and save the file. Now that pem file is there in the ansible server, we can use that to connect to any remote server

Before we before proceed to install ansible, let us check the connection can be established or not, for that run the following commands

```bash
ssh -i "YOUR_PEM_FILE_NAME.pem" ubuntu@TARGET_EC2_PUBLIC_IP
```
On success, we can see that a ssh connection is been establish between ansible server and target ec2 instance

### Installing Ansible on EC2 instance 
After the test is done, we have to close the connection to target ec2 instance, we shall see the ansible ec2 instance. To install ansible in the EC2 instance, we need to run the following commands,

```bash
sudo apt-get update
```

```bash
sudo apt-add-repository -y ppa:ansible/ansible
```

```bash
sudo apt-get update
```

```bash
sudo apt-get install -y ansible
```

```bash
sudo apt install python3-pip
```

```bash
pip3 install boto3
```

```bash
ansible --version
```

### Configuring Ansible to install Apache server on EC2

Now successfull execution of commands we can see that the ansible was installed without any errors. Now that ansible is successfully installed, we need to configure the ansible hosts, to connect to the EC2 instance and perform certain tasks. In order to do so, run the following commands

```bash
sudo nano /etc/ansible/hosts
```

```bash
[all:vars]
ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[Apache_Group]  
TARGET_PRIVATE_IP ansible_ssh_user=ubuntu ansible_ssh_private_key_file=YOUR_PEM_FILE_NAME.pem ansible_python_interpreter=/usr/bin/python3
```
Copy this contents and paste them in host file, and save then exit

Now that ansible hosts are configured, we need create playbooks, where we need to define the tasks. In order to do so, run the following commands,

```bash
mkdir playbooks
```

```bash 
sudo nano playbooks/apache.yml
```

```bash
- name: Apache Installation
  hosts: Apache_Group
  become: true
  tasks:
    - name: Install Apache
      apt: name=apache2 state=present update_cache=yes

    - name: Ensure Apache has started
      service: name=apache2 state=started enabled=yes
```
Copy these contents and paste them in the apache.yml file and save then exit.

Now that we have created our playbooks, we need run them to perform tasks in target ec2 instance. In order to do so run the following commands,

```bash
sudo ansible-playbook playbooks/main.yml
```

On running this command, you will get an error,which says "Permissions 0644 for 'sethu.pem' are too open". To resolve this, we need to change the permissions on pem file. In order to do so, run the following commands

```bash
sudo chmod 400 YOUR_PEM_FILE_NAME.pem
```
Now run the commands,

```bash
sudo ansible-playbook playbooks/main.yml
```
You will see that ansible playbook is running, and after sometime the tasks will run successfully, and will go to console and locate the target public ip and paste it in the broswer, to check whether apache is installed or not

Now that the playbook ran successfully, locate the public ip of the target EC2 instance and paste it the browser, you shall that apache ubuntu default html page is rendering which means that we have successfully installed apache in remote server using ansible

### For prometheus setup, install this role and run the playbooks

```bash
ansible-galaxy install --roles-path /home/ubuntu/playbooks/roles cloudalchemy.prometheus
```

### Clean up of the created resources
Now the everything is running successfully, we need to clean up created resources in order to do so run the following commands

```bash
terraform -chdir=infrastructure destroy --auto-approve
```
This commands will destroy the created infrastructure, so that you do not get charged additional costs.Now that infrastructure is deleted we also need to delete the TF_STATE_BUCKET, first empty the bucket from the console and the delete the bucket

Well that is it from this demo.

