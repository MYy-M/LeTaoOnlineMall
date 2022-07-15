package com.letao.mall.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.CustomExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class RabbitMqConfig {
    //4个路由key  4个队列 2个交换机

    //延迟交换机
    public static final String DELAY_EXCHANGE_NAME="delay.exchange";
    //延迟队列
    public static final String DELAY_QUEUE_NAME="delay.queue";
    //路由key
    public static final String DELAY_QUEUE_ROUTING_KEY="delay.queue.rountingkey";

    //声明延迟交换机
    @Bean("delayExchange")
    public CustomExchange delayExchange(){
        Map<String,Object> args=new HashMap<>();
        args.put("x-delayed-type","direct");
        return new  CustomExchange(DELAY_EXCHANGE_NAME,"x-delayed-message",true,false,args);
    }

    //声明延迟队列,并绑定到对应的死信交换机
    @Bean("delayQueue")
    public Queue delayQueue(){
        return new Queue(DELAY_QUEUE_NAME);
    }


    //声明延迟队列A的绑定关系
    @Bean
    public Binding delayBinding(@Qualifier("delayQueue") Queue queue,
                                 @Qualifier("delayExchange") CustomExchange delayExchange){
        return BindingBuilder.bind(queue).to(delayExchange).with(DELAY_QUEUE_ROUTING_KEY).noargs();
    }

}
