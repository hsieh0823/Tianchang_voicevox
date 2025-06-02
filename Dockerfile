FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 下載 voicevox_engine 壓縮檔並解壓
RUN curl -L -o voicevox_engine.zip https://github.com/VOICEVOX/voicevox_engine/releases/download/0.14.5/voicevox_engine-linux-x64-cpu-0.14.5.zip && \
    unzip voicevox_engine.zip && \
    rm voicevox_engine.zip

COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

EXPOSE 50021

ENTRYPOINT ["/app/entrypoint.sh"]