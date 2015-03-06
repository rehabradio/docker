Rehabradio - Docker
===========


This repo is designed to provide docker support for all of the web apps for rehabradio.


Setup
===============
As some of the apps require `.env` files for storing sensitive data, you are required to make to files:

	server-core.env
	socket-server.env

Place these inside of the ops/secrets folder. These fills will be added to their related repos on build.
You can find the required settings for each of these files in their related repos:

	server-core.env > https://github.com/rehabradio/server-core
	socket-server.env > https://github.com/rehabradio/socket-server


Running the app
===============

This app uses [Docker][docker] and the makefiles to make running all of the apps as simple as possible.
Ensure docker is installed on your system ([Installation instructions][docker_compose_install]), and in your terminal run:

    $ make run

This will boot up a number of docker containers exposing ports at
FE server is located at:			`3000`
Socket server is located at:		`5000`
BE server is located at:			`8000`

Then visit the running frontend application [http://127.0.0.1:3000](http://127.0.0.1:3000)
Or the backend api application [http://127.0.0.1:8000](http://127.0.0.1:8000)

*Note if you are running this with boot2docker, ensure you have mapped your vm's ports are mapped correctly with:

	VBoxManage controlvm boot2docker-vm natpf1 "node,tcp,127.0.0.1,3000,,3000"
    VBoxManage controlvm boot2docker-vm natpf1 "flask,tcp,127.0.0.1,5000,,5000"
    VBoxManage controlvm boot2docker-vm natpf1 "django,tcp,127.0.0.1,8000,,8000"

Check out the `Makefile` in the repository root for all available commands.

Stopping the app
===============

To stop the app, simply press `Ctrl+C` in the running terminal.

[docker]: https://docker.io  "Docker"
[docker_compose_install]: https://docs.docker.com/compose/install/  "Docker & Compose Installation"