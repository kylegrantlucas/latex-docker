FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

# Update APT
RUN apt-get update

# Install Requirements
RUN apt-get -y install fontconfig texlive-xetex texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra fonts-lato subversion

# Install Google Fonts
RUN svn checkout https://github.com/google/fonts/trunk/ofl/raleway /googlefont/ofl/raleway
RUN mkdir -p /fonts
RUN mv /googlefont/ofl/raleway /fonts/

# Cleanup
RUN  apt-get purge -f -y make-doc \
  texlive-fonts-extra-doc \
  texlive-fonts-recommended-doc \
  texlive-humanities-doc \
  texlive-latex-base-doc \
  texlive-latex-extra-doc \
  texlive-latex-recommended-doc \
  texlive-metapost-doc \
  texlive-pictures-doc \
  texlive-pstricks-doc \
  texlive-science-doc &&\
  fc-cache -fv &&\
  apt-get clean &&\
  apt-get autoclean -y &&\
  apt-get autoremove -y &&\
  apt-get clean &&\
  rm -rf /tmp/* /var/tmp/* &&\
  rm -rf /var/lib/apt/lists/* &&\
  rm -f /etc/ssh/ssh_host_* &&\
  rm -rf /googlefont

WORKDIR /data
VOLUME ["/data"]
