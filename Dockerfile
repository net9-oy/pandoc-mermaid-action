FROM pandoc/latex:edge-alpine

WORKDIR /action/workspace

ENV PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium-browser" \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"

RUN set -x \
  && apk update \
  && apk upgrade \
  \
  # Add the packages
  && apk add --no-cache dumb-init curl make gcc g++ python3 linux-headers binutils-gold gnupg libstdc++ nss chromium \
    npm bash git freetype ttf-freefont ca-certificates harfbuzz \
  && npm install -g puppeteer chromium https://github.com/drnachio/mermaid-filter-docker-ready --unsafe-perm=true \
  \
  # Do some cleanup
  && apk del --no-cache make gcc g++ python3 binutils-gold gnupg libstdc++ \
  && rm -rf /usr/include \
  && rm -rf /var/cache/apk/* /root/.node-gyp /usr/share/man /tmp/* \
  && echo

ENTRYPOINT ["pandoc", "-F", "mermaid-filter", "-o"]