ARG BASE_IMAGE
FROM ${BASE_IMAGE}
RUN ln -fs /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl git \
    && curl -fsSL https://deb.nodesource.com/setup_19.x | bash -  \
    && apt-get update \
    && apt-get install nodejs \
    && apt-get install -f -y pandoc texlive-xetex libgbm1 libnss3 libnss3 libasound2 fonts-liberation chromium-browser\
    && apt-get install -f -y python3-pip \
    && apt-get purge -y --auto-remove \
    && apt-get remove -y git \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /app

COPY ./src/gen.sh /app/.
COPY ./config/puppeteer-config.json /app/.puppeteer.json
COPY pyproject.toml poetry.lock /app/

RUN useradd -ms /bin/bash pandoc
RUN chmod +x /app/gen.sh && chown -R pandoc /app

RUN pip install --upgrade pip poetry

# RUN cat /root/.npm/_logs/*

USER pandoc
WORKDIR /app
RUN poetry install
RUN npm install mermaid-filter puppeteer

CMD ["/bin/bash", "/app/gen.sh"]
