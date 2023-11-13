FROM pandoc/latex:2.13

ENV CHROME_BIN="/usr/bin/chromium-browser"
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"

RUN apk add --update chromium npm bash
RUN npm install -g mermaid-filter@1.4.5 --unsafe-perm=true

ENTRYPOINT ["/usr/bin/pandoc"]
CMD ["-F", "mermaid-filter", "-o", "README.pdf", "README.md"]