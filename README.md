# Teaching Container

A Docker container I use for my machine learning lectures.

Includes

* Miniconda Python 3
* scikit-learn 0.18.1
* keras 2 with Tensorflow backend
* matplotlib and seaborn
* Jupyter notebook (launched at start)

The container is also prepared for mapping the container X11 output to that of the host, so applications with a Graphical Interface can be used.

## Prerequisites

You will need <a href=https://www.docker.com/>Docker Community Edition</a>. Working under a Linux operative system is strongly recommended, but if you wish to work under Windows or Mac it might be best for you to install <a href=https://www.docker.com/products/docker-toolbox>Docker Toolbox</a>.

## Usage

Run

    docker run --rm -it -p 8888:8888 -v $(pwd):/home/developer -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix teaching-container

in a terminal while standing at the folder with the downloaded lab assignments. Then follow the link to the Jupyter notebook service that will appear in the terminal.

