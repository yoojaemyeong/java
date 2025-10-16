# Jupyter 
FROM jupyter/datascience-notebook

# 루트로 전환해 OS 패키지 설치
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-21-jdk wget unzip && \
    rm -rf /var/lib/apt/lists/*

# JDK 경로 설정
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# 다시 jovyan 사용자로
USER ${NB_UID}

# IJava(자바 커널, 1.3.0) 설치
RUN wget -q https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip && \
    unzip -q ijava-1.3.0.zip -d /tmp/ijava && \
    python3 /tmp/ijava/install.py --sys-prefix && \
    rm -rf /tmp/ijava ijava-1.3.0.zip

# 기본 작업 폴더
WORKDIR /home/jovyan
