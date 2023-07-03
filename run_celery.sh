#!/bin/sh

# wait for RabbitMQ server to start
sleep 5

-c "celery -A app worker -l info"