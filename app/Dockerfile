# Python runtime as a parent image
FROM python:3.8-slim

# Environment variables
ENV APP_HOME /app
ENV USER nonrootuser

# Create a non-root user and set it's home directory
RUN useradd -m -d $APP_HOME $USER

# Set the working directory to /app
WORKDIR $APP_HOME

# Copy the current directory contents into the container at /app
COPY . $APP_HOME

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Change ownership of the application directory to the non-root user
RUN chown -R $USER:$USER $APP_HOME

# Specify the user to run the application
USER $USER

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run simpletimeservice.py when the container launches
CMD ["python", "simpletimeservice.py"]