# FROM alpine:3.9.2
FROM jenkins/agent:alpine-jdk11
# RUN apk add curl
USER root
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.18.3
