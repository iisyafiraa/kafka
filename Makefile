include .env

help:
	@echo "## docker-build		- Build Docker Images (amd64) including its inter-container network."
	@echo "## kafka             - Spinup kafka cluster."
	@echo "## jupyter           - Spinup jupyter notebook for testing and validation purposes."

docker-build:
	@echo '__________________________________________________________'
	@echo 'Building Docker Images ...'
	@echo '__________________________________________________________'
	@docker network inspect kafka-network >/dev/null 2>&1 || docker network create kafka-network
	@echo '__________________________________________________________'
	@docker build -t dataeng-kafka/jupyter -f ./docker/Dockerfile.jupyter .

jupyter:
	@echo '__________________________________________________________'
	@echo 'Creating Jupyter Notebook Cluster at http://localhost:${JUPYTER_PORT} ...'
	@echo '__________________________________________________________'
	@docker compose -f ./docker/docker-compose-jupyter.yml --env-file .env up -d
	@echo 'Created...'
	@echo 'Processing token...'
	@sleep 20
	@docker logs ${JUPYTER_CONTAINER_NAME} 2>&1 | grep '\?token\=' -m 1 | cut -d '=' -f2
	@echo '==========================================================='

kafka: 
	@echo '__________________________________________________________'
	@echo 'Creating Kafka Cluster with 2 Brokers ...'
	@echo '__________________________________________________________'
	@docker compose -f ./docker/docker-compose-kafka.yml --env-file .env up -d
	@echo 'Waiting for uptime on http://localhost:8083 ...'
	@sleep 20
	@echo '==========================================================='

kafka-create-topic:
	@echo '__________________________________________________________'
	@echo 'Creating Kafka Topic ...'
	@echo '__________________________________________________________'
	@sleep 30  
	@docker exec ${KAFKA_CONTAINER_NAME_1} \
		kafka-topics.sh --create \
		--partitions ${KAFKA_PARTITION} \
		--replication-factor ${KAFKA_REPLICATION} \
		--bootstrap-server ${KAFKA_HOST_1}:9092,${KAFKA_HOST_2}:9092 \
		--topic ${KAFKA_TOPIC_NAME}
	@echo 'Topic Created!'
	@echo '==========================================================='
	@docker exec ${KAFKA_CONTAINER_NAME_1} kafka-topics.sh --list --bootstrap-server $(KAFKA_HOST_1):9092,$(KAFKA_HOST_2):9092

proto: 
	@protoc --python_out=. ./protobuf/protobuf_schema.proto
	