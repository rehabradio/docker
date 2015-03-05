FROM nodesource/node:trusty
# replace this with your application's default port

RUN apt-get install -y wget

# Install heroku toolbelt (foreman)
RUN wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

RUN npm install -g nodemon

EXPOSE 3000