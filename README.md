# Teaching Container

A Docker container I use for my machine learning lectures.

Includes

* Miniconda Python 3
* scikit-learn 0.18.1
* keras 2
* matplotlib and seaborn
* Jupyter notebook (launched at start)

## Prerequisites

* <a href=https://www.docker.com/>docker</a>

## Usage

Run

    docker run --rm -it -p 8888:8888 -v $(pwd):/labs teaching-container

in a terminal while standing at the folder with the downloaded lab assignments. Then follow the link to the Jupyter notebook service that will appear in the terminal.

