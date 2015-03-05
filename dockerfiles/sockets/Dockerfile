FROM ubuntu:14.04
MAINTAINER Mark McConnell <mark@rehabstudio.com>

# get up to date
RUN apt-get update && apt-get upgrade -y

# global installs [applies to all envs!]
RUN apt-get install -y build-essential git vim wget
RUN apt-get install -y python python-dev python-setuptools python-pip

# Install heroku toolbelt (foreman)
RUN wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Install python dependicies
ADD assets/requirements.txt /opt/venv/requirements.txt
RUN pip install -r /opt/venv/requirements.txt