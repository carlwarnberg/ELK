# What are the security benefits of defining cloud infrastructure as code?

Infrastructure as code allows for consistent configuration of a cloud network’s resources and prevents environmental drift. You could access each machine on the network and configure them individually, but this would take much more time to do, and could lead to a lack of consistency across the network over time, making it much harder to address potential errors in network deployment and delivery, and make it harder to quickly resolve issues and make updates in response to exposed vulnerabilities or a cyber attack. 
In my cybersecurity bootcamp, we had a project where we had to deploy a cloud network in Azure. This network had a jump box provisioner, two web servers, and an ELK server. We implemented infrastructure as code by installing an Ansible container on the jump box, and used Ansible to run playbooks to configure the servers on the network.

I ran four playbooks to configure the VMs on my network:
* A playbook to install docker.io, pip3, and launch the DVWA containers on the web servers
* A playbook to install docker.io, pip3, and launch an ELK container on my ELK server 
* A playbook to install and configure filebeat on the web servers 
* A playbook to install and configure metricbeat on the web servers
 
After running the first playbook, I tested that it was successful by SSH-ing into the web VMs and running the curl command and receiving an HTML response from the DVWA containers. To test that the ELK server was up and running, I navigated to Kibana in my browser over port 5601, and checked to see that it was receiving data and system logs from filebeat and metricbeat. 
IAC streamlines configuration because if there are changes and updates that need to be made, you can update the source code and run the updates simultaneously. One disadvantage I can see in IAC is that because you are running someone else’s code, it may not have all of the features required for your specific environment, and you have to take the time to parse through it to understand what needs to be added or removed. But overall, I think it provides a good template and starting point, rather than having to configure everything from scratch. 
