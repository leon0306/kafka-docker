FROM wurstmeister/kafka:2.11-1.1.0

MAINTAINER Boxuan <chenboxuan3@xdf.com>

COPY consumer.properties /opt/kafka/config/consumer.properties
COPY producer.properties /opt/kafka/config/producer.properties
COPY kafka_jaas.conf /opt/kafka/config/kafka_jaas.conf
COPY jmxremote.access /opt/kafka/config/jmxremote.access
COPY jmxremote.password /opt/kafka/config/jmxremote.password

ENV KAFKA_DELETE_TOPIC_ENABLE="true" \
    KAFKA_SECURITY_INTER_BROKER_PROTOCOL="SASL_PLAINTEXT" \
    KAFKA_SASL_ENABLED_MECHANISMS="PLAIN" \
    KAFKA_SASL_MECHANISM_INTER_BROKER_PROTOCOL="PLAIN" \
    JMX_PORT="1099" \
    KAFKA_JMX_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=true -Dcom.sun.management.jmxremote.access.file=/opt/kafka/config/jmxremote.access -Dcom.sun.management.jmxremote.password.file=/opt/kafka/config/jmxremote.password -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=192.168.212.128 -Dcom.sun.management.jmxremote.rmi.port=1099 -Djava.security.auth.login.config=/opt/kafka/config/kafka_jaas.conf"

RUN chown 600 /opt/kafka/config/jmxremote.* \
 && alias kafka-console-producer.sh='kafka-console-producer.sh --producer.config /opt/kafka/config/producer.properties' \
 && alias kafka-console-consumer.sh='kafka-console-consumer.sh --consumer.config /opt/kafka/config/consumer.properties' \
 && alias kafka-producer-perf-test.sh='kafka-producer-perf-test.sh --producer.config /opt/kafka/config/producer.properties' \
 && alias kafka-consumer-perf-test.sh='kafka-consumer-perf-test.sh --consumer.config /opt/kafka/config/consumer.properties'
