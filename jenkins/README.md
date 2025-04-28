# README file for tracking jenkins deployment. This file tracks all changed.
28-APR-2025 17:50 - First commit of Jenkins and Postres DB, docker-compose.yml. Pods are up, basic cofiguration is done.
# docker-compose ps
NAME          IMAGE                       COMMAND                  SERVICE       CREATED          STATUS          PORTS
db_postgres   postgres:15                 "docker-entrypoint.s…"   db_postgres   28 minutes ago   Up 28 minutes   0.0.0.0:5432->5432/tcp, [::]:5432->5432/tcp
jenkins       jenkins/jenkins:lts-jdk17   "/usr/bin/tini -- /u…"   jenkins       28 minutes ago   Up 28 minutes   0.0.0.0:8080->8080/tcp, [::]:8080->8080/tcp, 50000/tcp 
