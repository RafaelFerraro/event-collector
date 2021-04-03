# event-collector
Collecting events stored in a local kafka broker.

# Running
In order to run this project locally, you need to run a kafka server at port 9092. To do so, you can follow these steps:

Go to Apache Kafka web page and download the source files. In my case, I used the version 2.7.0 and you can download this version clicking [here](https://downloads.apache.org/kafka/2.7.0/kafka_2.13-2.7.0.tgz)

After download, we should extract the tar file downloaded:

```
$ tar -xzf kafka_2.13-2.7.0.tgz
$ cd kafka_2.13-2.7.0
```

Great! So lets start! In order to run kafka, we need to run two servers. The first one, [zookeepper server](https://zookeeper.apache.org/) and the second one, the kafka server:

```
$ bin/zookeeper-server-start.sh config/zookeeper.properties
$ bin/kafka-server-start.sh config/server.properties
```

After that, we need to create our topic and starting to send messages there:

```
// Create my-topic topic
$ bin/kafka-topics.sh --create --topic my-topic --bootstrap-server localhost:9092

// Send messages to my-topic
$ bin/kafka-console-producer.sh --topic my-topic --bootstrap-server localhost:9092
>Hello!
>This is my first message :)
```

Thanks for [Apache Kafka Quick Start page](https://kafka.apache.org/quickstart).

That's all. Then we can start to consume those sent messages. We just need to start the phobos and VOILA! Those sent messages will be consumed by our listener:

```
$ phobos start
```

```
--------------- A new message arrived! --------------------
Message: Hello!
-------------- Message consumed... ------------------------
--------------- A new message arrived! --------------------
Message: This is my first message :)
-------------- Message consumed... ------------------------
