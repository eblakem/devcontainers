
FROM mcr.microsoft.com/mssql/server:2022-latest

# Change active user to root
USER root 

# Create a scripts directory
RUN mkdir -p /scripts

# Set mssql as owner of the app directory
RUN chown mssql /scripts

# Create app directory
WORKDIR /scripts

# Copy initialization scripts
COPY . /scripts

# Grant permissions so our scripts can be executable
RUN chmod +x /scripts/entrypoint.sh
RUN chmod +x /scripts/init-db.sh

# Set environment variables, not have to write them with the docker run command
# Note: make sure that your password matches what is in the run-initialization script 
ENV MSSQL_SA_PASSWORD str0NGPassw0RD
ENV ACCEPT_EULA Y

# Change back to user mssql
USER mssql

# Expose port 1433 in case accessing from other container
# Expose port externally from docker-compose.yml
EXPOSE 1433

# Run Microsoft SQL Server and initialization script (at the same time)
CMD /bin/bash /scripts/entrypoint.sh
