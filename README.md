# Bedrock RAG API

A FastAPI-based REST API that integrates with AWS Bedrock Knowledge Bases for Retrieval-Augmented Generation (RAG) queries.

## Features

- Query AWS Bedrock Knowledge Bases using natural language prompts
- RESTful API built with FastAPI
- Docker containerization for easy deployment
- Configurable via environment variables

## Prerequisites

- Python 3.9+
- AWS credentials configured (via AWS CLI, environment variables, or IAM roles)
- Access to AWS Bedrock services in your region

## Environment Variables

Set the following environment variables:

- `AWS_REGION`: AWS region (default: `us-east-1`)
- `MODEL_ID`: Bedrock model ARN (default: `anthropic.claude-3-5-sonnet-20240620-v1:0`)

## Local Development

1. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Run the application:
   ```bash
   uvicorn bedrockrag:app --host 0.0.0.0 --port 8000
   ```

The API will be available at `http://localhost:8000`

## Docker

### Build the image:
```bash
docker build --platform linux/amd64 -t bedrockrag-image:latest .
```

### Run the container:
```bash
docker run -p 8000:8000 -e AWS_REGION=us-east-1 -e MODEL_ID=your-model-arn bedrockrag-image:latest
```

## API Usage

### POST /query

Query a Knowledge Base with a prompt.

**Request Body:**
```json
{
  "prompt": "does debayan has any Azure experience?",
  "kbId": "your-knowledge-base-id"
}
```

**Response:**
```json
{
  "response":"Yes, Debayan has Azure experience. His expertise includes working with Azure Subscriptions, Azure AD/Entra Id, Azure DevOps, and Azure AI Foundry. Additionally, he has delivered projects using Azure technologies, including:\n\n1. The first GenAI project using the Azure AI platform for BP.\n2. Building a data platform in Azure for Booth Transport, which involved Azure Data Gateway and Microsoft Fabric.\n\nThis experience demonstrates that Debayan has practical knowledge and hands-on experience with various Azure services and technologies."
}
```

**Example using curl:**
```bash
curl -X POST "http://localhost:8000/query" \
     -H "Content-Type: application/json" \
     -d '{"prompt": "Does Debayan has SAML experience?", "kbId": "your-kb-id"}'
```

## API Documentation

When running locally, visit `http://localhost:8000/docs` for interactive Swagger UI documentation.

## Project Structure

- `bedrockrag.py`: Main FastAPI application
- `requirements.txt`: Python dependencies
- `Dockerfile`: Docker build configuration
- `.gitignore`: Git ignore rules

## License

[Add your license here]