# Start from Ubuntu 16.04 base image
FROM tensorflow/tensorflow:1.15.0-gpu-py3

#key signing issue with cuda repo can be fixed by removing from apt sources and re-adding in apt-get update 
RUN rm /etc/apt/sources.list.d/cuda.list

# Set environment variables to avoid interaction during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install prerequisites
RUN apt-get update --fix-missing && \
    apt-get install -y --allow-unauthenticated \
    wget bzip2 ca-certificates curl git \
    software-properties-common \
    build-essential \
    libssl-dev \
    libffi-dev

# Example of installing TensorFlow GPU for TensorFlow 1.2.0 (Optional)
RUN pip install --upgrade pip && \
    pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host=files.pythonhosted.org keras pyfaidx pysam numpy pandas jupyterlab

# Default command
CMD ["python", "--version"]