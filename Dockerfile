FROM python:3-slim
MAINTAINER Krennic

RUN mkdir -p /usr/share/man/man1

#Install texlive-full in one layer
RUN apt-get update && \
    apt-get install -y \
    	make\
    	wget \
    	mercurial \
    	git \
    	xzdec \
    	texlive-latex-extra \
        texlive-lang-french \
    	openjdk-7-jre \
    	graphviz \
    	dvipng \
    	latexmk \
    	wkhtmltopdf \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install sphinx \
    recommonmark \
    sphinx-autobuild \
    sphinx_bootstrap_theme \
    sphinx_rtd_theme \
    sphinxcontrib-plantuml \
    lxml

RUN wget -P /plant https://sourceforge.net/projects/plantuml/files/plantuml.jar/download && \
    mv /plant/download /plant/plantUML.jar

WORKDIR /usr/local/lib/python3.6/site-packages

RUN hg clone https://bitbucket.org/haraisao/sphinx-docxbuilder

WORKDIR /workspace
