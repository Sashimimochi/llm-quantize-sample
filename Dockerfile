FROM python:3.11

RUN apt-get update && \
    apt-get install -y wget build-essential cmake git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install --upgrade setuptools && \
    pip install -r requirements.txt

# llama.cppをcloneしてビルド
RUN git clone https://github.com/ggerganov/llama.cpp.git /opt/llama.cpp && \
    cd /opt/llama.cpp && \
    pip install -r requirements.txt && \
    mkdir -p build && \
    cd build && \
    cmake .. && \
    cmake --build . --config Release -j $(nproc) && \
    cp bin/llama-quantize /usr/local/bin/ && \
    cp bin/llama-cli /usr/local/bin/

ARG workdir=/projects/
WORKDIR $workdir
