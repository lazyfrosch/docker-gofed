FROM fedora:26

RUN dnf install -y git python-pip python-devel redhat-rpm-config graphviz rpm-build rpmdevtools \
 && curl -LsS "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" > /usr/sbin/gosu \
 && chmod +x /usr/sbin/gosu

RUN git clone --depth=1 https://github.com/gofed/gofed /opt/gofed

RUN pip install -r /opt/gofed/requirements.txt \
 && cd /opt/gofed \
 && ./hack/prep.sh

ENV USER=markus \
    UID=1000 \
    GID=1000

COPY entrypoint.sh /entrypoint
COPY gofed /usr/local/bin

VOLUME /opt/gofed/working_directory

ENTRYPOINT [ "/entrypoint" ]
CMD [ "gofed" ]
