# kafka-docker
Kafka 1.1.0 docker images with SASL_PLAIN 

+ 启动命令如下
```
docker run --name kafka-1 -p 9092:9092 -p 1099:1099 \
-e KAFKA_ZOOKEEPER_CONNECT="192.168.212.128:2181" \
-e KAFKA_ADVERTISED_LISTENERS="SASL_PLAINTEXT://192.168.212.128:9092" \
-e KAFKA_LISTENERS="SASL_PLAINTEXT://0.0.0.0:9092" \
-e KAFKA_BROKER_ID="0" -d xdf/kafka-sasl:1.1.0
```
