ARG ARCH
FROM --platform=${ARCH} ubuntu:24.04

# apt-get docker settings
ENV APT_INSTALL="apt-get install -y --no-install-recommends"
ENV DEBIAN_FRONTEND=noninteractive

# install apt-get deps
RUN cat /etc/resolv.conf
RUN cat /etc/apt/sources.list
RUN rm -rf  /var/lib/apt/lists/* \
    && apt-get update \
    && $APT_INSTALL \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && $APT_INSTALL \
    python3-pip \
    git 

# install pip deps
RUN python3 -m pip config set global.break-system-packages true
RUN pip3 install librosa soundfile
# enforce cpu backend
RUN python3 --version
RUN pip3 install torch==2.3.1+cpu \
    torchaudio==2.3.1+cpu \
    -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install git+https://github.com/linto-ai/whisper-timestamped

# copy repo into image
COPY . /root/whisper_streamer

# move to working directory
RUN cd /root/whisper_streamer
WORKDIR /root/whisper_streamer
