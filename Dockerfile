FROM fedora:28

RUN dnf install -y git python-pip python-devel redhat-rpm-config graphviz rpm-build rpmdevtools \
 && curl -LsS "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" > /usr/sbin/gosu \
 && chmod +x /usr/sbin/gosu \
 && git clone --depth=1 https://github.com/gofed/gofed /opt/gofed \
 && pip install -r /opt/gofed/requirements.txt \
 && (cd /opt/gofed && ./hack/prep.sh) \
 && rm -rf /var/cache/dnf/ /opt/gofed/.git/ /usr/lib/locale/*

COPY entrypoint.sh /entrypoint
COPY gofed /usr/local/bin

VOLUME /opt/gofed/working_directory

ENTRYPOINT [ "/entrypoint" ]
CMD [ "gofed" ]
