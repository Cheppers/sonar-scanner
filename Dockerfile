FROM node:latest

WORKDIR /project

RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-8-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN npm config set unsafe.perm true && \
    npm install -g sonarqube-scanner && \
    sonar-scanner --version

ENTRYPOINT ["sonar-scanner"]
