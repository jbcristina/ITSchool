FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1

COPY script.py .

RUN useradd -m -s /bin/bash mover

USER mover

CMD ["python","script.py"]

