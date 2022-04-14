#!/usr/bin/env python
import pika

credentials = pika.PlainCredentials('rabbit', 'rabbit_pass')
connection = pika.BlockingConnection(pika.ConnectionParameters('localhost',5672,'/',credentials))
channel = connection.channel()
channel.queue_declare(queue='hello')
channel.basic_publish(exchange='',
                      routing_key='hello',
                      body='Hello World! by jacob2')
print(" [x] Sent 'Hello World!'")
connection.close()
