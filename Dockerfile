FROM python:3
MAINTAINER Krennic

#Install texlive-full in one layer
RUN apt-get update && \
    apt-get install -y git xzdec texlive-full openjdk-7-jre graphviz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install sphinx \
    recommonmark \
    sphinx-autobuild \
    sphinx_bootstrap_theme \
    sphinx_rtd_theme \
    sphinxcontrib-plantuml

RUN wget -P /plant https://sourceforge.net/projects/plantuml/files/plantuml.jar/download && \
    mv /plant/download /plant/plantUML.jar

WORKDIR /workspace
