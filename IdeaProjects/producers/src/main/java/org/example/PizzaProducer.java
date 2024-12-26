package org.example;

import com.github.javafaker.Faker;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;
import org.apache.kafka.common.serialization.StringSerializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Properties;
import java.util.Random;
import java.util.concurrent.ExecutionException;

public class PizzaProducer {
    public static final Logger logger = LoggerFactory.getLogger(PizzaProducer.class.getName());

    public static void sendPizzaMessage(KafkaProducer<String, String> kafkaProducer,
                                        String topicName, int iterCount,
                                        int interIntervalMills, int intervalMillis,
                                        int intervalCount, boolean sync){
        PizzaMessage pizzaMessage = new PizzaMessage();
        int iterSeq = 0;

        long seed = 2022;
        Random random = new Random(seed);
        Faker faker = Faker.instance(random);

        while( iterSeq++ != iterCount){
            HashMap<String, String> pMessage = pizzaMessage.produce_msg(faker, random, iterSeq);
            ProducerRecord<String, String> producerRecord = new ProducerRecord<>(topicName,
                    pMessage.get("key"), pMessage.get("message"));
            sendMessage(kafkaProducer,producerRecord,pMessage,sync);

            if((intervalCount > 0) && (iterSeq % intervalCount == 0)){
                try {
                    logger.info("###### IntervalCount:" + intervalCount +
                            "intervalMillis" + intervalMillis + " #########");
                    Thread.sleep(intervalMillis);
                } catch (InterruptedException e) {
                    logger.error(e.getMessage());
                }
            }
            // 건당 쉬는거
            if(interIntervalMills > 0){
                try {
                    logger.info("interIntervalMillis:" + interIntervalMills);
                    Thread.sleep(interIntervalMills);
                } catch (InterruptedException e) {
                    logger.error(e.getMessage());
                }
            }
        }
    }
    public static void sendMessage(KafkaProducer<String, String> kafkaProducer,
                                   ProducerRecord<String, String> producerRecord,
                                   HashMap<String, String> pMessage, boolean sync){
// kafkaProducer message send
        if(!sync) {
            kafkaProducer.send(producerRecord, (metadata, exception) -> {
                if (exception == null) {
                    logger.info("async message:" + pMessage.get("key") + "partition: " + metadata.partition() +
                            "offset: " + metadata.offset() +
                            "timestamp: " + metadata.timestamp()
                    );
                } else {
                    logger.error("exception error from broker" + exception.getMessage());
                }
            });
        } else {
            try {
                RecordMetadata recordMetadata = kafkaProducer.send(producerRecord).get();
                logger.info("sync message" + pMessage.get("key") +
                        "partition: " + recordMetadata.partition() +
                        "offset: " + recordMetadata.offset()
                );
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e) {
                e.printStackTrace();
            }
        }
    }
    public static void main(String[] args) {
        String topicName = "pizza-topic";
//        KafkaProducer configuration setting
        // null, "hello world"
        Properties props = new Properties();
//        bootstrap.servers,
        props.setProperty("bootstrap.servers", "192.168.56.101:9092");
        props.setProperty(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "192.168.56.101:9092");
        props.setProperty(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        props.setProperty(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
//        props.setProperty(ProducerConfig.ACKS_CONFIG, "0");
//        Idempotence는 max_inflight 값이 1~5사이로 해야한다.
        props.setProperty(ProducerConfig.MAX_IN_FLIGHT_REQUESTS_PER_CONNECTION, "6");
        // batch Setting
        props.setProperty(ProducerConfig.BATCH_SIZE_CONFIG, "32000");
        // linger.ms 설정
        props.setProperty(ProducerConfig.LINGER_MS_CONFIG, "20");
        props.setProperty(ProducerConfig.PARTITIONER_CLASS_CONFIG, "org.example.CustomPartitioner");


        // KafkaProducer object creation

        KafkaProducer<String, String> kafkaProducer = new KafkaProducer<String, String>(props);

        sendPizzaMessage(kafkaProducer,topicName,
                -1, 1000, 0,
                0, true);

        kafkaProducer.close();
    }
}
