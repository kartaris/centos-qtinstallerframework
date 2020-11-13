FROM kartaris/centos-qt

MAINTAINER "kartaris" <rust768@gmail.com>

RUN dnf -y install git make && dnf clean all

# Cloning, building and installing Qt Installer Framework
RUN cd /home && git clone https://github.com/qtproject/installer-framework.git && cd installer-framework && git checkout 3.2.3 && git submodule update --init --recursive
RUN cd /home/installer-framework && qmake-qt5 -r && make && make install
RUN rm -rf /home/installer-framework

