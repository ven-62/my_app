# Use a lightweight official Python image
FROM python:3.12-slim

# Prevent Python from writing .pyc files and enable logs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# THIS FIXES YOUR IMPORT ERROR
ENV PYTHONPATH=/app

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project
COPY . .

# Default command: run tests
CMD ["pytest"]