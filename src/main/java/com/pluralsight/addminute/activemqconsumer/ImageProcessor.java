package com.pluralsight.addminute.activemqconsumer;

import javax.jms.Connection;
import javax.jms.JMSException;
import javax.jms.MessageConsumer;
import javax.jms.Queue;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;

public class ImageProcessor implements Runnable {
	public static void main(String[] args) {
		Runnable ip = new ImageProcessor();
		Thread t = new Thread(ip);
		t.start();
	}

	@Override
	public void run() {
		Connection connection = null;
		try {
			ActiveMQConnectionFactory jmsConnectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");
			connection = jmsConnectionFactory.createConnection();
			connection.start();
			Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
			Queue photoQueue = session.createQueue("photo");

			MessageConsumer consumer = session.createConsumer(photoQueue);
			while (true) {
				TextMessage message = (TextMessage) consumer.receive();
				String payload = message.toString();
				System.out.println(" queue " + payload);
			}
		} catch (JMSException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.stop();
				} catch (JMSException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
