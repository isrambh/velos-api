FROM python:3.12-slim AS builder

WORKDIR /build

COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


FROM python:3.12-slim AS test

WORKDIR /app

COPY --from=builder /install /usr/local
COPY app.py .
COPY tests/ tests/

RUN python -m unittest discover -s tests -v


FROM python:3.12-slim

WORKDIR /app

COPY --from=builder /install /usr/local
COPY app.py .

RUN useradd --create-home --uid 1000 appuser \
    && chown -R appuser:appuser /app

USER appuser

ENV PORT=8000
EXPOSE 8000

CMD ["python", "app.py"]
