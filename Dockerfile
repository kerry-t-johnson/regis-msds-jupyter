FROM jupyter/tensorflow-notebook:lab-3.2.9

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
                         file                                              \
                         graphviz                                          \
                         less                                              \
                         lsb-release                                       \
                         openjdk-8-jdk-headless                       &&   \
     echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64"             \
     >> /etc/profile.d/20-java.sh

RUN  apt-get purge -y    python2.7                                         \
                         python3.8                                    &&   \
     apt autoremove -y                                                &&   \
     rm -rf /etc/python2.7

USER jovyan

RUN  pip install    gensim                                                 \
                    graphviz                                               \
                    gym                                                    \
                    hdfs                                                   \
                    jupyterlab-git                                         \
                    jupyter_contrib_nbextensions                           \
                    keras-tuner                                            \
                    kaggle                                                 \
                    nltk                                                   \
                    pydot                                                  \
                    pygame                                                 \
                    pyldavis                                               \
                    pymongo                                                \
                    pyspark                                                \
                    pyyaml                                                 \
                    smart_open                                             \
                    tweepy                                                 \
                    wordcloud                                              \
                    xgboost                                                \
                    yellowbrick
