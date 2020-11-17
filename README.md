# devops03

create applicatioin-${ENV}.properties file to configmap

kubectl create configmap hello-world-app --from-file=/root/devops03/src/main/resources/application-sbx.properties

hello-world-app -- configmap name
