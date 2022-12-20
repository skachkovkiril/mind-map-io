FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code/

RUN pip install pipenv

COPY backend/Pipfile backend/Pipfile.lock /code/

RUN set -ex && pipenv install --system --dev

COPY .env /code/

COPY backend /code/

EXPOSE 8000