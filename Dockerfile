FROM public.ecr.aws/docker/library/python:3.8-bullseye

RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH=$PATH:/root/.local/bin

WORKDIR /app

COPY pyproject.toml poetry.lock /app/

RUN poetry config virtualenvs.create false && poetry install

COPY . /app
