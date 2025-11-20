FROM python:3.8

RUN apt-get update && apt-get install -y \
    python3-dev \
    build-essential \
    libhdf5-dev \
    libatlas-base-dev \
    liblapack-dev \
    gfortran \
    && rm -rf /var/lib/apt/lists/*

# Install compatible versions
RUN pip install --no-cache-dir \
    numpy==1.21.0 \
    tensorflow==2.9.0 \
    h5py==3.6.0 \
    streamlit \
    matplotlib \
    pillow

WORKDIR /app
COPY . /app

CMD ["streamlit", "run", "app/app.py"]
