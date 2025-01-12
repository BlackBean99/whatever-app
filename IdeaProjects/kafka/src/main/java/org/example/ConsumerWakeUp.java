package org.example;


import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.errors.WakeupException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.time.Duration;
import java.util.List;
import java.util.Properties;

public class ConsumerWakeUp {
    public static final Logger logger = LoggerFactory.getLogger(ConsumerWakeUp.class.getName());

    public static void main(String[] args) {
        String topicName = "pizza topic";
//        KafkaProducer configuration setting
        // null, "hello world"
        Properties props = new Properties();
//        bootstrap.servers,
        props.setProperty("bootstrap.servers", "192.168.56.101:9092");
        props.setProperty(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "192.168.56.101:9092");
        props.setProperty(ConsumerConfig.GROUP_ID_CONFIG, "group_01");
        props.setProperty(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
        // static group membership
        props.setProperty(ConsumerConfig.GROUP_INSTANCE_ID_CONFIG, "1");
        // KafkaProducer object creation
        KafkaConsumer<String, String> kafkaConsumer = new KafkaConsumer<>(props);
        // ProducerRecord object creation

        //mainThread 참조 변수
        Thread mainThread = Thread.currentThread();
        // main Thread 종료시 별도의 thread로 kafkaConsumer wakeup()메소드를 호출R
        kafkaConsumer.subscribe(List.of(topicName));
        Runtime.getRuntime().addShutdownHook(new Thread(){
            public void run(){
                logger.info(" main program starts to exit by calling wakeup");
                kafkaConsumer.wakeup();
                try{
                    mainThread.join();
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }
        });

        kafkaConsumer.wakeup();
        try{
            while (true) {
                ConsumerRecords<String, String> consumerRecords = kafkaConsumer.poll(Duration.ofMillis(1000));
                for (ConsumerRecord record : consumerRecords) {
                    logger.info("record key:{}, record value:{}, partition:{}, record offset:{}, record.value:{}",
                            record.key(), record.value(), record.partition(), record.offset(),record.value());
                }
            }
        }catch (WakeupException e){
            logger.error("wakeup exception has been called");
        }finally {
            logger.info("finally consumer is closing");
            kafkaConsumer.close();
        }

    }
}
