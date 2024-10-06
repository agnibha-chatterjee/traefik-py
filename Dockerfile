FROM python:3.11-alpine

WORKDIR /app

RUN apk add --no-cache curl

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="/root/.local/bin:$PATH"

COPY pyproject.toml poetry.lock ./

RUN poetry lock --no-update 
RUN poetry install

COPY . .

CMD ["poetry", "run", "fastapi", "run", "main.py"]
