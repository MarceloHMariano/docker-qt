# Qt Development Environment

[![GitHub](https://img.shields.io/github/license/marcelohmariano/qt.svg)](LICENSE)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/marcelohmariano/qt.svg)](https://hub.docker.com/r/marcelohmariano/qt)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/marcelohmariano/qt.svg)](https://hub.docker.com/r/marcelohmariano/qt/builds)

This [Docker](https://www.docker.com/) image is intended to provide a development
environment for Qt. It contains the [Qt](https://www.qt.io) libraries and tools,
a C++ compiler and a debugger.

## Prerequisites

Make sure you have all of the following prerequisites on your development machine:

- [Git](https://git-scm.org/) - [Download and install Git](https://git-scm.org/downloads/).
This is going to be used to clone this repository to your machine.
- [Docker](https://www.docker.com/) - [Download and install Docker](https://docs.docker.com/install/) - This is going to be used to build the Qt environment image.

## Building

Once you have satisfied all the prerequisites above you can build your image.\
To do that open a command terminal and run the following commands:

```sh
git clone https://github.com/marcelohmariano/qt.git
cd qt
docker build -t qt .
```

## Usage

### Start a container with no GUI support

```sh
docker run -it --rm qt bash
```

### Start a container with GUI support (by sharing the .Xauthority file)

```sh
docker run -it --rm \
  -v $HOME/.Xauthority:/home/dev/.Xauthority \
  -e DISPLAY \
  --network host \
  --privileged \
  qt \
  qtcreator
```

That assumes you are running a Linux OS.

## License

This project is licensed under the MIT License found in the [LICENSE](LICENSE) file.
