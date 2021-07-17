# RabbitMQ Cluster Operator Helm Chart

Install the operator. Its recommended to install the operator in its own namespace

Current Operator version: 1.8.0
```
helm install rabbitmq-cluster-operator rabbitmq-cluster-operator-0.0.1.tgz --create-namespace --namespace rabbitmq-system
```
