FROM scratch

ADD centos-7.8.2003-x86_64-docker.tar.xz /

LABEL \
    system="oasr" \
    app="TBNR_release_time" \
    vendor="CMOS" \
    author="Ivan Du" \
    version="2.1.2"

ADD zh-cn-utf8.tar.gz /

RUN set -eux; \
    cd zh-cn-utf8; \
    rpm -ivh kde-filesystem-4-47.el7.x86_64.rpm  \
             kde-l10n-4.10.5-2.el7.noarch.rpm  \
             kde-l10n-Chinese-4.10.5-2.el7.noarch.rpm; \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8; \
    echo 'LANG="zh_CN.UTF-8"' > /etc/locale.conf; \
    rm -rf /var/cache/yum/* /zh-cn-utf8; \
    ulimit -c unlimited

# 定义时区参数和编码字符集。
ENV TZ="Asia/Shanghai" \
    LANG="zh_CN.UTF-8"

COPY TBNR_release_time /TBNR_release_time
COPY [ "tini","/usr/local/bin/" ]

WORKDIR /TBNR_release_time/bin

ENV LD_LIBRARY_PATH="./:../KWSAPI_ENV/KWSAPI_LIBLINUX:${LD_LIBRARY_PATH}" \
    TEL2NUM="false" \
    LINENUM="2" \
    IP="127.0.0.1" \
    PORTS="6608" \
    PATH="/TBNR_release_time/bin:${PATH}"

EXPOSE 6608/tcp

CMD [ "/bin/bash","-c","exec tini -- offline_customer_server_test_dnnvad -ip ${IP} -port ${PORTS} -format 8K_16BIT_PCM -sysDir ../model -num ${LINENUM} -config WFSTDecoder-inputMethod_dnn_onlyrec.cfg  -tel2Num ${TEL2NUM}" ]