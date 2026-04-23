# app/Dockerfile or repo-root Dockerfile

FROM python:3.12-slim

# Prevent .pyc files and enable real-time logs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Make app package importable
ENV PYTHONPATH=/app

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app ./app

# Expose Flask port
EXPOSE 5000

# Run Flask app
CMD ["python", "-m", "app.main"]