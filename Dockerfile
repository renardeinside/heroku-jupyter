# Heroku jupyter file
FROM centos
RUN yum install -y wget
RUN yum install -y git
RUN yum install -y bzip2
RUN mkdir -p /opt/conda
RUN wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O /opt/conda/conda-inst.sh
RUN chmod +x /opt/conda/conda-inst.sh
RUN /opt/conda/conda-inst.sh -b -f -p /opt/conda
RUN /opt/conda/bin/conda install jupyter
RUN /opt/conda/bin/conda install keras
RUN /opt/conda/bin/conda install matplotlib
RUN mkdir -p /opt/notebooks
WORKDIR /opt/notebooks
#ENV PORT=8848
#ENTRYPOINT ["/opt/conda/bin/jupyter"]
CMD /opt/conda/bin/jupyter-notebook --ip=0.0.0.0 --no-browser --allow-root --port=$PORT
