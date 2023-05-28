FROM tokumeikoi/lcrp

RUN apk update && \
    apk add --no-cache vim

# Download and install ioncube
RUN wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz && \
    tar xzf ioncube_loaders_lin_x86-64.tar.gz && \
    mv ioncube/ioncube_loader_lin_7.4.so /usr/lib/php7/modules && \
    rm -rf ioncube

RUN <<EOF cat >> /etc/php7/conf.d/00_ioncube-loader.ini
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ionCube PHP Loader + ionCube24 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

zend_extension=ioncube_loader_lin_7.4.so
EOF