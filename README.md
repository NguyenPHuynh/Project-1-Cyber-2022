# Project-1-Cyber-2022
This is the first project for Cyber BootCamp 2022

The files in this repository were used to configure the network depicted below.

<img width="804" alt="Project1_NetworkTopologies" src="https://user-images.githubusercontent.com/104466052/166391308-e52071e7-5e77-41cb-8c48-ff32ec26c0d5.png">

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - [Install Elk](https://github.com/NguyenPHuynh/Project-1-Cyber-2022/blob/e3ef6b1e409ae8bf45b14f3f31cc7d3a17d3afb2/install-elk.yml)
  - [Filebeat Playbook](https://github.com/NguyenPHuynh/Project-1-Cyber-2022/blob/96e7f959ecbe1962e6fa8ade3c57f0b2512e232c/filebeat-playbook.yml)
  - [Metricbeat Playbook](https://github.com/NguyenPHuynh/Project-1-Cyber-2022/blob/96e7f959ecbe1962e6fa8ade3c57f0b2512e232c/metricbeat-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


*** Description of the Topology ***

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
 
   * Load balancers protect the servers from DoSS (Denial of Service Attack). A load balancer  distributes traffic amongst the backpool servers. By using a jump box, its ensure that your VMs are protected from public exposure. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system performance.

- Filebeat forwarded and centralized log data. 
- Metricbeat collected metrics from the system and services running on the server.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.2.0.4   |Linux ubuntu 18.04|
| DVWA-VM1 |    VM    | 10.2.0.7   |Linux ubuntu 18.04|
| DVWA-VM2 |    VM    | 10.2.0.8   |Linux ubuntu 18.04|
| ELK VM   | ElkStack | 10.3.0.4   |Linux ubuntu 18.04|

*** Access Policies ***

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

**104.208.109.232** (This IP addresses will change everytime the VMs is shut down from Azure website)

Machines within the network can only be accessed by Port 22.

- JumpBox 10.2.0.4 is also able to access the ELK VM.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | NO                  | SSH @ 77.114.49.180  |
| DVWA-VMs | NO                  |      10.2.0.4        |
| ELK Stack| NO                  |      10.2.0.4        |

*** Elk Configuration ***

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because Ansible can be run from the command line and ensure our scripts run indentically everywhere.

[Elk install File](https://github.com/NguyenPHuynh/Project-1-Cyber-2022/blob/96e7f959ecbe1962e6fa8ade3c57f0b2512e232c/install-elk.yml)

The playbook implements the following tasks:
- Install docker.io
- Install python-pip
- Install docker python module
- Increase Virtual Memory
- Download and launch docker elk container
- Enable service docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

<img width="592" alt="ScreenShot of Docker PS" src="https://user-images.githubusercontent.com/104466052/166586492-5f9ca2f0-fcbe-40f1-a460-55ad8320b21c.png">


*** Target Machines & Beats ***

This ELK server is configured to monitor the following machines:

- Web1 DVWA_VM 10.2.0.7
- Web2 DVWA_VM 10.2.0.8

We have installed the following Beats on these machines:

- filebeat-7.6.1-amd64.deb

These Beats allow us to collect the following information from each machine:

- Filebeat will monitors and send log files to kibana. Filbeat monitors and collects log event on specificed servers. 

*** Using the Playbook ***

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-configuration.yml file to ELK VM.
- Update the hosts file to include 10.2.0.7, 10.2.0.8, 10.3.0.4
- Run the playbook, and navigate to Kibana (http://20.53.254.249:5601/) to check that the installation worked as expected.

$ ansible-playbook filebeat-playbook.yml
