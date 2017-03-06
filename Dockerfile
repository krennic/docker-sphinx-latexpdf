FROM python:3
MAINTAINER Krennic

RUN apt-get update && \
	apt-get install -y git mercurial texlive-full xzdec && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	pip install sphinx \
				recommonmark \
				sphinx-autobuild \
				sphinx_bootstrap_theme \
				sphinx_rtd_theme \
				sphinxcontrib-plantuml

WORKDIR /documents