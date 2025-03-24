# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /code

# Copy project files
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app/ /code/app

# Set PYTHONPATH to include the working directory
ENV PYTHONPATH "${PYTHONPATH}:/code/app"

# Expose port 8000
EXPOSE 8091

# Command to run the FastAPI application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8091", "--reload"]
