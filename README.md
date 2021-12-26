## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Diagram/Final ELK diagram .drawio.pdf

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.


This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available , in addition to restricting traffic to the network.
  *What aspects of security do load balencers protect? Availability, Web Traffic, Web Security
  *What is the advantage of a jump box? Security and Access control

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
 *What does Filebeat watch for? the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
 *What does Metricbeat record? It takes the metrics and statistics that it collects and ships them to the output that you specify

The configuration details of each machine may be found below.

| Name                  | Function      | IP Address                | Operating system |
|-----------------------|---------------|---------------------------|------------------|
| Jump Box Provisioner  | Gateway       | 10.0.0.10/ 104.43.234.158 | Linux            |
| Web-1                 | Web Server    | 10.0.0.11                 | Linux            |
| Web-2                 | Web Sever     | 10.0.0.12                 | Linux            |
| ELK Server            | ELK Server    | 10.2.0.4/20.127.74.241    | Linux            |
| Load Balancer         | Load Balancer | 40.113.219.168            | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Elk Server machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
*The Authorized Workstation public IP on TCP port 22

Machines within the network can only be accessed by
  *Jump Box Provisioner
  *Authorized Workstation

A summary of the access policies in place can be found in the table below.

| Name                  | Publicly Accessible  | Allowed IP address                     |
|-----------------------|----------------------|----------------------------------------|
| Jump Box Provisioner  | No                   | Authorized Workstation IP SSH Port 22  |
| Web-1                 | No                   | 10.0.0.10/104.43.234.158 SSH Port 22   |
| Web-2                 | No                   | 10.0.0.10/104.43.234.158 SSH Port 22   |
| ELK Server            | No                   | Authorized Workstation IP TCP Port 22  |
| Load Balancer         | No                   | Authorized Workstation IP HTTP Port 80 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
*Ansible playbooks give you a fast abd easy way to deploy and install multiple apps without having to manually install each one

The playbook implements the following tasks:
  *Speicify the ELK server machine and the remote user
  * Installs docker IO, python3-pip, Docker python module
  * Increases system memory
  * Launches and exploses the container to published ports
      -5601:5601
      -9208:9200
      -5044:5044

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
  *Web-1 10.0.0.11
  *Web-2 10.0.0.12

We have installed the following Beats on these machines:
  *Elk Server
  *Web-1
  *Web-2

These Beats allow us to collect the following information from each machine:
  *Log Events 
  *Metrics and system Stats

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ELk Install playbook file to Elk Server
- Update the gilebeat-playbook.yml file to include. curl command for installing filebeat: curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.4.0-amd64.deb
- Run the playbook, and navigate to Kibana > Logs : Add log data > System logs > 5:Module Status > Check data, to check to check that the installation worked as expected.

Answer the following questions to fill in the blanks:_
  *Which file is the playbook? Where do you copy it? into the Ansible directory 
  *Which file do you update to make Ansible run the playbook on a specific machine? filebeat-playbook.yml for filebeat and MetricBeat-playbook for Metricbeat
  
  *How do I specify which machine to install the ELK server on versus which to install Filebeat on? In the playbook, change the host name to where it is being run
  *Which URL do you navigate to in order to check that the ELK server is running? http://20.127.74.241/apps/kibana
