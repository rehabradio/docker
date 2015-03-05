FE_BRANCH = master
BE_BRANCH = master
SOCKETS_BRANCH = master

# Pulls down the latest client-web repo
# The repo branch can be updated by changing the FE_BRANCH variable at the top of this file
frontend:
	if test -d apps/client-web; then \
		cd apps/client-web && git pull origin $(FE_BRANCH); \
	else \
		git clone -b $(FE_BRANCH) git@github.com:rehabradio/client-web.git apps/client-web; \
	fi

# Pulls down the latest server-core repo
# The repo branch can be updated by changing the BE_BRANCH variable at the top of this file
backend:
	if test -d apps/server-core; then \
		cd apps/server-core && git pull origin $(BE_BRANCH); \
	else \
		git clone -b $(BE_BRANCH) git@github.com:rehabradio/server-core.git apps/server-core; \
	fi
	# Copy over the secrets file over to the local repo
	cp ops/secrets/server-core.env apps/server-core/.env

# Pulls down the latest socket-server repo
# The repo branch can be updated by changing the SOCKETS_BRANCH variable at the top of this file
sockets:
	if test -d apps/socket-server; then \
		cd apps/socket-server && git pull origin $(SOCKETS_BRANCH); \
	else \
		git clone -b $(SOCKETS_BRANCH) git@github.com:rehabradio/socket-server.git apps/socket-server; \
	fi
	# Copy over the secrets file over to the local repo
	cp ops/secrets/socket-server.env apps/socket-server/.env

# Build out the npm modules
build-fe:
	docker-compose run frontend npm install

# Runs all of the apps and postgres server and redis server, to create a complete working env of all the web apps
# FE server is located at:			127.0.0.1:3000
# Socket server is located at:		127.0.0.1:5000
# BE server is located at:			127.0.0.1:8000
run: frontend backend sockets build-fe
	docker-compose up
