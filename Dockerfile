FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/* 

COPY ./ ./
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir --upgrade boto3 botocore 

EXPOSE 8000
CMD ["uvicorn", "bedrockrag:app", "--host", "0.0.0.0", "--port", "8000"]