package com.pluralsight.service;

import javax.jms.Connection;
import javax.jms.MessageProducer;
import javax.jms.Queue;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class JMSBean {
	
	// @Autowired
	ActiveMQConnectionFactory jmsConnectionFactory = new ActiveMQConnectionFactory();
	
	public void submit(String message) throws Exception {
		Connection connection = jmsConnectionFactory.createConnection();
		connection.start();
		Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
		Queue photoQueue = session.createQueue("photo");
		MessageProducer producer = session.createProducer(photoQueue);
		TextMessage textMessage = session.createTextMessage(message);
		producer.send(textMessage);
		connection.stop();
	}
}
