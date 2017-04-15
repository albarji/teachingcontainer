FROM continuumio/miniconda3:4.3.11

# Install required conda packages
RUN conda install -y \
    scikit-learn=0.18.1 \
    keras=2 \
    matplotlib \
    seaborn \
    jupyter

# Prepare labs folder
WORKDIR /labs

# Export Jupyter port
EXPOSE 8888

# Start jupyter
ENTRYPOINT jupyter notebook --allow-root --ip='*' --port=8888 --no-browser
