FROM ghcr.io/linuxserver/papermerge

RUN \
  apt-get update && \
 echo "**** install build packages ****" && \
 apt-get install -y \
        --no-install-recommends \
        tesseract-ocr-deu && \
 echo "**** cleanup ****" && \
 rm -rf \
        /root/.cache \
        /tmp/* && \
 apt-get clean -y

COPY --chown=abc:abc papermerge.conf.py /config/

EXPOSE 8000
