# Consume and Produce Events from kafka Topic using Python

## Description
This project demonstrates how to implement a Kafka Producer and Consumer using Python to produce and consume events from a Kafka Topic. The events consist of random product sale data serialized using Protobuf and published to a Kafka topic. The Consumer then consumes this data, deserializes it, and performs basic statistics calculations such as total sales and average sales.

## Project Structure
Here’s the structure of the project:
```bash
├── docker
│   ├── docker-compose-jupyter.yml       # Docker Compose for Jupyter Notebook
│   ├── docker-compose-kafka.yml        # Docker Compose for Kafka Cluster
│   └── Dockerfile.jupyter              # Dockerfile for Jupyter with Python dependencies
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

`make docker-build`: Build the Jupyter Docker image.
`make jupyter`: Start the Jupyter Notebook service.
`make kafka`: Start the Kafka Cluster.
`make kafka-create-topic`Create a Kafka topic
`make proto`: Create a Proto

Let me know if you need further adjustments!
