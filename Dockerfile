FROM python:3
MAINTAINER Krennic

#Install texlive-full in one layer
RUN apt-get update && \
	apt-get install -y texlive-full && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
	apt-get install -y git xzdec && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN	pip install sphinx \
				recommonmark \
				sphinx-autobuild \
				sphinx_bootstrap_theme \
				sphinx_rtd_theme \
				sphinxcontrib-plantuml

RUN apt-get update && \
	apt-get install -y openjdk-8-jre && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	wget -P $JAVA_HOME/jre/lib/ext https://sourceforge.net/projects/plantuml/files/plantuml.jar/download 

WORKDIR /documents