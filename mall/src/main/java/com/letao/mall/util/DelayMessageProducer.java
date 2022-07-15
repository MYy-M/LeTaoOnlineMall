package com.letao.mall.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.LocalDateTime;

import static com.letao.mall.config.RabbitMqConfig.DELAY_EXCHANGE_NAME;
import static com.letao.mall.config.RabbitMqConfig.DELAY_QUEUE_ROUTING_KEY;

@Slf4j
@Component
public class DelayMessageProducer {

    @Resource
    private RabbitTemplate rabbitTemplate;

    //time是毫秒
    public void send(String message,Integer time){
        rabbitTemplate.convertAndSend(DELAY_EXCHANGE_NAME,DELAY_QUEUE_ROUTING_KEY,message,msg->{
            msg.getMessageProperties().setDelay(time);
            log.info("当前时间：{} 新加入 {}", LocalDateTime.now(),msg);
            return msg;
        });

    }

}

