# Use a base image with bash and basic utilities
FROM ubuntu:latest

# Maintainer information
LABEL maintainer="[Your Name] <[Your Email]>"

# Install necessary packages
RUN apt-get update && \
    apt-get install -y lynx bash && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the script into the container
COPY your_script_name.sh /app/your_script_name.sh

# Make the script executable
RUN chmod +x /app/your_script_name.sh

# Set the working directory
WORKDIR /app

# Command to run the script
CMD ["/app/your_script_name.sh"]

