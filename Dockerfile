FROM nvidia/cuda:12.1.0-cudnn8-devel-ubuntu22.04

RUN apt-get update && apt-get -y upgrade && apt-get install -y python3-pip python3-venv git vim

RUN mkdir -p /swallow

WORKDIR /swallow

RUN pip3 install jupyter notebook && \
    pip3 install torch==2.2.2 torchvision==0.17.2 torchaudio==2.2.2 --index-url https://download.pytorch.org/whl/cu121 && \
    pip3 install transformers==4.41.2 accelerate bitsandbytes

CMD ["jupyter","notebook","--ip=0.0.0.0","--port=8888","--NotebookApp.token=''","--allow-root"]
