# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /code

# Copy project files
COPY app/requirements.txt /code/app/requirements.txt
RUN pip install --no-cache-dir -r /code/app/requirements.txt --platform manylinux2014_x86_64 --target /code/app --only-binary=:all:
COPY app/ /code/app

# Set the PYTHONPATH environment variable
ENV PYTHONPATH="/code/app"

# Add the custom dependencies directory to PATH for executables
ENV PATH="/code/app/bin:$PATH"

# Expose port 8000
EXPOSE 8091

# Command to run the FastAPI application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8091", "--reload"]
