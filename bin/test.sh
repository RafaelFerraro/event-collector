#!/bin/bash

exec $(dirname $0)/kafka-console-producer.sh --topic my-topic --bootstrap-server localhost:9092
