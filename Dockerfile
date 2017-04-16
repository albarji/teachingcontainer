FROM ubuntu:14.04

# Install system tools
RUN apt-get update --fix-missing && \
    apt-get install -y \
        wget \
        bzip2 \
        ca-certificates \
        libglib2.0-0 \
        libxext6 \
        libsm6 \
        libxrender1 \
        git \
        vim

# Install miniconda
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.3.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh
ENV PATH /opt/conda/bin:$PATH

# Install required conda packages
RUN conda install -y \
    scikit-learn=0.18.1 \
    keras=2 \
    matplotlib \
    seaborn \
    jupyter

# Export Jupyter port
EXPOSE 8888

# Allow for X11 displays on host
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer
USER developer
ENV HOME /home/developer

# Set Tensorflow backend in keras
COPY keras.json /home/developer/.keras/keras.json

# Prepare labs folder
WORKDIR /home/developer

# Start jupyter
ENTRYPOINT jupyter notebook --ip='*' --port=8888 --no-browser
