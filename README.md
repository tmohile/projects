# README file in top level GIT managed repository, pwd: /opt/admin/projects/
# This README file will track changes.
21-MAY-2025 10:45 - Added host based folder 'host-monitor-bootstrap' for host monitor-bootstrap, 
		    this host intended to handle stage1 monitoring and bootstrap of resources.
		    Added 'host-monitor-bootstrap/uptime-kuma/docker-compose.yml' to start uptime-kuma docker, 
		    uptime-kuma is configured on host monitor-bootstrap to monitor all resources,
		    All hosts will have configuration files managed via this git repository.
		    All hosts code and config files will be created under this project tree to rsync with each host.
		    Added 'scripts/LOGIN_AUTOMATION/pkeylogin.sh' to automate passwordless, 
		    PKI login to enable rsync between hosts 'Orchestrator' and 'monitor-bootstrap'.
		    Added 'host-monitor-bootstrap/scripts/pkeylogin_v1.0.sh' to sync scripts across hosts.

01-MAY-2025 21:00 - Added scripts folder to handle all shell scripts needed for automation and other tasks.
		    First script added VM_AUTOMATION/vSphere_VM_AutoMation.sh

28-APR-2025 12:50 - Changed repository branch name from 'master' to 'main'. As per updated by github since version 2.28.
