FROM acore/ac-wotlk-dev-server:7.0.0-dev.1 as compiler

USER root

ENV OSDISTRO Ubuntu

COPY .github/config.sh config.sh

RUN cd modules && \
    git clone https://github.com/azerothcore/mod-ah-bot && \
    cd /azerothcore && \
    ./acore.sh compiler build

FROM acore/ac-wotlk-worldserver:7.0.0-dev.1

COPY --from=compiler /azerothcore/acore.json acore.json
COPY --from=compiler /azerothcore/acore.sh acore.sh
COPY --from=compiler /azerothcore/apps apps
COPY --from=compiler /azerothcore/bin bin
COPY --from=compiler /azerothcore/conf conf
COPY --from=compiler /azerothcore/data data
COPY --from=compiler /azerothcore/deps deps
COPY --from=compiler /azerothcore/env env
COPY --from=compiler /azerothcore/var var
