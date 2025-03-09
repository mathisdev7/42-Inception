NAME		= inception
SRCS		= .
COMPOSE		= $(SRCS)/docker-compose.yml
HOST_URL	= mazeghou.42.fr

all:
	@sudo apt-get -y install hostsed
	@sudo hostsed add 127.0.0.1 mazeghou.42.fr && echo "added mazeghou.42.fr to /etc/hosts"
	@sudo mkdir -p /home/mazeghou/data/mariadb
	@sudo mkdir -p /home/mazeghou/data/wordpress
	@sudo -E docker compose up -d --build

down:
	@sudo hostsed rm 127.0.0.1 mazeghou.42.fr && echo "removed mazeghou.42.fr from /etc/hosts"
	@sudo -E docker compose down

re:
	@sudo -E docker compose up -d --build

clean:
	@echo "🧹 Nettoyage complet de Docker..."
	@sudo rm -rf /home/mazeghou/data/mariadb
	@sudo rm -rf /home/mazeghou/data/wordpress
	@echo "📦 Suppression des conteneurs, images, volumes et réseaux..."
	@docker stop $$(docker ps -qa) 2>/dev/null || true
	@docker rm -f $$(docker ps -qa) 2>/dev/null || true
	@docker rmi -f $$(docker images -qa) 2>/dev/null || true
	@docker volume rm -f $$(docker volume ls -q) 2>/dev/null || true
	@docker network rm $$(docker network ls -q) 2>/dev/null || true
	@echo "🗑️  Suppression des fichiers temporaires Docker..."
	@docker system prune -af --volumes
	@echo "✅ Docker complètement nettoyé."

.PHONY: all re down clean
