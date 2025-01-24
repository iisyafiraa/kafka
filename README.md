# Consume and Produce Events from Kafka Topic using Python

## Description
This project demonstrates how to implement a Kafka Producer and Consumer using Python to produce and consume events from a Kafka Topic. The events consist of random product sale data serialized using Protobuf and published to a Kafka topic. The Consumer then consumes this data, deserializes it, and performs basic statistics calculations such as total sales and average sales.

## Project Structure
Here’s the structure of the project:
```bash
├── docker
│   ├── docker-compose-jupyter.yml      # Docker Compose for Jupyter Notebook
│   ├── docker-compose-kafka.yml        # Docker Compose for Kafka Cluster
│   └── Dockerfile.jupyter              # Dockerfile for Jupyter with Python dependencies
├── ksql
│   ├── 0. stream-ksql.sql              # Create stream KSQL
│   └── 1. direct-stream-ksql.sql       # Direct stream KSQL
├── notebooks
│   ├── customer.ipynb                  # Notebook for Kafka Consumer
│   └── producer.ipynb                  # Notebook for Kafka Producer
├── protobuf
│   └── protobuf_schema.proto           # Protobuf schema for product sale data
├── Makefile                            # Makefile to manage Docker and Kafka tasks
└── .env                                # Environment configuration file
```

## Usage Instruction

### Run Makefile
The Makefile includes commands for managing Docker and Kafka services:

```bash
1. Run `make docker-build`
2. Run `make jupyter`
3. Run `make kafka`
4. Run `make kafka-create-topic`
5. Run `make proto`
```

Let me know if you need further adjustments!