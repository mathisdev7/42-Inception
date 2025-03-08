NAME		= inception
SRCS		= .
COMPOSE		= $(SRCS)/docker-compose.yml
HOST_URL	= mazeghou.42.fr

all:
	@sudo apt-get -y install hostsed
	@sudo hostsed add 127.0.0.1 mazeghou.42.fr && echo "added mazeghou.42.fr to /etc/hosts"
	@sudo mkdir -p /home/mazeghou/data/mariadb
	@sudo mkdir -p /home/mazeghou/data/wordpress
	@sudo docker compose up -d --build

down:
	@sudo hostsed rm 127.0.0.1 mazeghou.42.fr && echo "removed mazeghou.42.fr from /etc/hosts"
	@sudo docker compose down

re:
	@sudo docker compose up -d --build

clean:
	@sudo rm -rf /home/mazeghou/data/mariadb
	@sudo rm -rf /home/mazeghou/data/wordpress
	@sudo docker stop $$(docker ps -qa);\
	sudo docker rm $$(docker ps -qa);\
	sudo docker rmi -f $$(docker images -qa);\
	sudo docker volume rm $$(docker volume ls -q);\
	sudo docker network rm $$(docker network ls -q);\

.PHONY: all re down clean
