#!/bin/bash
set -eox pipefail #safety for script

# https://github.com/aws-samples/kubernetes-for-java-developers
echo "=============================Dashboard============================================================="
git clone https://github.com/aws-samples/kubernetes-for-java-developers.git
cd app && mvn spring-boot:run
echo $(curl http://localhost:8080/hello)
echo $(curl http://127.0.0.1:8080/hello)
echo "=============================Dashboard============================================================="
