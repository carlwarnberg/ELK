# Project-1
This repository contains the configuration files and ansible playbooks that I used to set up a DVWA deployment and an ELK monitoring stack on an Azure cloud network

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/carlwarnberg/Project-1/blob/main/Diagrams/Red_Team_Network.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  * [install-docker.yml](https://github.com/carlwarnberg/Project-1/blob/main/Ansible/install-docker.yml) - used to install docker and launch DVWA containers on the web servers
  * [install-elk.yml](https://github.com/carlwarnberg/Project-1/blob/main/Ansible/install-elk.yml) - used to install docker and launch an ELK container on the ELK server
  * [filebeat-playbook.yml](https://github.com/carlwarnberg/Project-1/blob/main/Ansible/filebeat-playbook.yml) - used to install and configure Filebeat on ELK & DVWA servers
  * [metricbeat-playbook.yml](https://github.com/carlwarnberg/Project-1/blob/main/Ansible/metricbeat-playbook.yml) - used to install and configure Metricbeat on ELK & DVWA servers

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
Load balancers protect the availability of a network because they can shift the flow of traffic between the web servers if one goes down. 
The Jump Box gives access to the entire network through a single node, making it easier to secure and monitor multipe VMs.


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- Filebeat monitors log files, collects log data and forwards it to logstash for indexing
- Metricbeat collects metrics and statistics from services running on the server and forwards them to elastisearch

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.1.0.4   | Linux (Ubuntu 18.0.4)           |
| ELK      | ELK Stack        | 10.0.0.4   | Linux (Ubuntu 18.0.4)            |
| Web-1    | Web Server       | 10.1.0.8   | Linux (Ubuntu 18.0.4)            |
| Web-2    | Web Server         | 10.1.0.10  | Linux (Ubuntu 18.0.4)            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Server can accept connections from the Internet. Access to this machine is only allowed from my host machine's IPV4 address.

Machines within the network can only be accessed via SSH.
- The ELK server is only accessible via SSH from the Jump Box Provisioner and via TCP from my host machine.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 104.5.152.217             |
| Web-1    | No                  | 10.1.0.4                     |
| Web-2    | No                  | 10.1.0.4                     |
| ELK      | No                  | 10.1.0.4                     |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it allows easy set up and use by running playbooks that apply changes and configurations simultaneously to both Web VMs which are specified in the Ansible Hosts file without having to log into each machine individually.


The playbook implements the following tasks:
- Installs Docker.io and pip3
- Increases the Virtual Machine memory
- Downloads and configures the ELK Docker container
- Sets the published ports

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt text](https://github.com/carlwarnberg/Project-1/blob/main/Diagrams/sudo_docker_ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 VM  10.1.0.8
- Web-2 VM  10.1.0.10

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat monitors for log files and locations and collects log events.
- Metricbeat records metrics and statistics from the operating system and from services running on the server.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the [filebeat-config.yml](https://github.com/carlwarnberg/Project-1/blob/main/Ansible/filebeat-config.yml) and [metricbeat-config.yml](https://github.com/carlwarnberg/Project-1/blob/main/Ansible/metricbeat-config.yml) files to etc/ansible/roles/files.
- Update the hosts configuration file (etc/ansible/hosts.cfg) to include a [webservers] group and an [elk] group, with the private IPs of your Web VMs and your ELK server listed under the appropriate groups. 
- Run the [install-elk.yml](https://github.com/carlwarnberg/Project-1/blob/main/Ansible/install-elk.yml) playbook, and navigate to (ELK-Server-PublicIP):5601 to check that the installation worked as expected.
- Run the [filebeat-playbook.yml](https://github.com/carlwarnberg/Project-1/blob/main/Ansible/filebeat-playbook.yml) and [metricbeat-playbook.yml](https://github.com/carlwarnberg/Project-1/blob/main/Ansible/metricbeat-playbook.yml) playbooks to install filebeat and metricbeat.

The commands needed to configure your ELK server are:
* `ssh username@(Jump-BoxIP)`
* `sudo docker container list -a`
* `sudo docker start (container name)`
* `sudo docker attach (container name)`
* `cd ../etc/ansible`
* `ansible-playbook install-elk.yml`
* `cd etc/ansible/roles`
* `ansible-playbook filebeat-playbook.yml`
* `ansible-playbook metricbeat-playbook.yml`
