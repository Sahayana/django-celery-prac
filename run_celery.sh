#!/bin/sh

# wait for RabbitMQ server to start
sleep 5

su -m myuser -c "celery -A app worker -l info"