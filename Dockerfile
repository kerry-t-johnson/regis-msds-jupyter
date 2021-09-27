FROM jupyter/tensorflow-notebook:lab-3.1.10

USER root

# ===== Mongo Shell ==========================================================
# Reference: https://docs.mongodb.com/mongodb-shell/install/#std-label-mdb-shell-install
RUN  apt-get update                                                   &&   \
     apt-get install -y  gnupg                                             \
                         wget                                         &&   \
     wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc |        \
     apt-key add -                                                    &&   \
     echo    "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | \
     tee /etc/apt/sources.list.d/mongodb-org-5.0.list                 &&   \
     apt-get update                                                   &&   \
     apt-get install -y  mongodb-mongosh


RUN  apt-get install -y  curl                                              \
                         lsb-release                                       \
                         graphviz                                          \
                         less


USER jovyan

RUN  pip install    graphviz                                               \
                    hdfs                                                   \
                    jupyterlab-git                                         \
                    kaggle                                                 \
                    pydot                                                  \
                    pymongo                                           &&   \
     jupyter labextension install  @jupyterlab/apputils                    \
                                   @jupyterlab/toc

