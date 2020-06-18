#!/bin/bash
set -eox pipefail #safety for script

# https://github.com/aws-samples/kubernetes-for-java-developers
#a simple Java application built using Spring Boot. The application publishes a REST endpoint that can be invoked at http://{host}:{port}/hello.
echo "=============================Java application built using Spring Boot============================================================="
apt-get -qq update && sudo apt-get install -qqy maven && mvn -version
mvn org.springframework.boot:spring-boot-maven-plugin:run
java -version
git clone https://github.com/aws-samples/kubernetes-for-java-developers.git
cd kubernetes-for-java-developers/app/ && mvn spring-boot:run
echo $(curl http://localhost:8080/hello)
echo $(curl http://127.0.0.1:8080/hello)
echo "=============================Java application built using Spring Boot============================================================="
