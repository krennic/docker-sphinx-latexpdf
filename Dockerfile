FROM python:3-alpine
MAINTAINER Krennic

#Install texlive-full in one layer
RUN apk add make git xzdec texlive-latex-extra openjdk-7-jre graphviz dvipng

RUN pip install sphinx \
    recommonmark \
    sphinx-autobuild \
    sphinx_bootstrap_theme \
    sphinx_rtd_theme \
    sphinxcontrib-plantuml

RUN wget -P /plant https://sourceforge.net/projects/plantuml/files/plantuml.jar/download && \
    mv /plant/download /plant/plantUML.jar

WORKDIR /workspace
