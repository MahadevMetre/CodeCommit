# Uninstall existing beats (which were part of previous kibana project) from all servers
	yum remove heartbeat-elastic -y
	yum remove metricbeat -y
	yum remove filebeat -y

# Install and configure Filebeat in auto scaling instances
	# Login to respective servers via WinScp
	# https://jenkins.franklinmadisonds.com/jenkins/view/terraform/job/terraform_create/6947/console
	# https://jenkins.franklinmadisonds.com/jenkins/view/terraform/job/terraform_create/6948/console
	# https://jenkins.franklinmadisonds.com/jenkins/view/terraform/job/terraform_create/6949/console
	# https://jenkins.franklinmadisonds.com/jenkins/view/terraform/job/terraform_create/6950/console
	rm -f /etc/filebeat/filebeat.yml
	touch /etc/filebeat/filebeat.yml
	chmod 644 /etc/filebeat/filebeat.*
	chmod 600 /etc/filebeat/filebeat.yml && clear && ll /etc/filebeat/
	grep setup.template.name /etc/filebeat/filebeat.yml


# Updating security groups to establish connectivity across servers
	# https://jenkins.franklinmadisonds.com/jenkins/view/terraform/job/terraform_create/6991/console
	# https://jenkins.franklinmadisonds.com/jenkins/view/terraform/job/terraform_create/6992/console
	# https://jenkins.franklinmadisonds.com/jenkins/view/terraform/job/terraform_create/6993/console
	# https://jenkins.franklinmadisonds.com/jenkins/view/terraform/job/terraform_create/6994/console
	# https://jenkins.franklinmadisonds.com/jenkins/view/terraform/job/terraform_create/6995/console
	# https://jenkins.franklinmadisonds.com/jenkins/view/terraform/job/terraform_create/6996/console

# Setup Filebeat in jboss admin (10.153.30.20)
	# Login to 10.153.30.20 via WinScp
	# Copy filebeat_30_20.yml to 10.153.30.20 /tmp/ directory
	mv /tmp/filebeat_30_20.yml /etc/filebeat/filebeat.yml
	chmod 644 /etc/filebeat/filebeat.*
	chmod 600 /etc/filebeat/filebeat.yml && clear && ll /etc/filebeat/
	chown root:root /etc/filebeat/filebeat.yml
	systemctl start filebeat

# Setup Filebeat in Nginx (Serverless) (10.153.31.20)
	# Create filebeat_cw_user_pci - Attach CloudWatchReadOnlyAccess
	# Login to 10.153.31.20 via WinScp
	# Copy filebeat_31_20.yml to 10.153.31.20 /tmp/ directory
	mv /tmp/filebeat_31_20.yml /etc/filebeat/filebeat.yml
	chmod 644 /etc/filebeat/filebeat.*
	chmod 600 /etc/filebeat/filebeat.yml && clear && ll /etc/filebeat/
	chown root:root /etc/filebeat/filebeat.yml
	systemctl start filebeat

# Setup Heartbeat to monitor the urls
	# Modify the ui lb security group to add 10.153.10.30/32 - port 443 HTTPS From ELK Heartbeat Instance
	# Add the dns entries in shared account for insurance,insuranceapps,mtservices,mtservicesapps
	# Modify the /etc/heartbeat/heartbeat.yml

# Setup Folder monitoring script
	# Crontab for root
		crontab -e
		*/5 * * * * python3 /root/fb_monitor/fb_monitor.py
		mkdir -p /root/fb_monitor/log_count/
		mkdir -p /root/fb_monitor/log_time/
		cd /root/fb_monitor/ && touch fb_monitor.py
		chmod 700 fb_monitor.py
		vi fb_monitor.py