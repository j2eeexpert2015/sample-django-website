# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install debugpy for debugging
RUN pip install debugpy

# Copy the entire project into the container
COPY . .

# Expose the port Django runs on
#EXPOSE 8000

# Expose ports: 8000 for Django and 5678 for the debugger
EXPOSE 8000 5678

# Run the application
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Run the application with debugpy
CMD ["python", "-m", "debugpy", "--wait-for-client", "--listen", "0.0.0.0:5678", "manage.py", "runserver", "0.0.0.0:8000"]
