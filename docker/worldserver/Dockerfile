FROM acore/ac-wotlk-dev-server:7.0.0-dev.1 as compiler

USER root

ENV OSDISTRO Ubuntu

COPY .github/config.sh config.sh

WORKDIR /azerothcore/modules

RUN git clone https://github.com/azerothcore/mod-eluna

RUN git clone https://github.com/azerothcore/mod-ah-bot

RUN git clone https://github.com/Gozzim/mod-globalchat

RUN git clone https://github.com/azerothcore/mod-solo-lfg

RUN git clone https://github.com/azerothcore/mod-buff-command

RUN git clone https://github.com/noisiver/mod-assistant

WORKDIR /azerothcore
RUN ./acore.sh compiler build

FROM acore/ac-wotlk-worldserver:7.0.0-dev.1

USER acore

COPY --from=compiler --chown=acore:acore /azerothcore/acore.json acore.json
COPY --from=compiler --chown=acore:acore /azerothcore/acore.sh acore.sh
COPY --from=compiler --chown=acore:acore /azerothcore/apps apps
COPY --from=compiler --chown=acore:acore /azerothcore/bin bin
COPY --from=compiler --chown=acore:acore /azerothcore/conf conf
COPY --from=compiler --chown=acore:acore /azerothcore/data data
COPY --from=compiler --chown=acore:acore /azerothcore/deps deps
COPY --from=compiler --chown=acore:acore /azerothcore/env env
COPY --from=compiler --chown=acore:acore /azerothcore/var var
