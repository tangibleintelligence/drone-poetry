FROM python:3.9

# Poetry version...also used as version to plugin
ENV POETRY_VERSION=1.1.13
ENV POETRY_HOME=/opt/poetry

# Install poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add to path
ENV PATH=/opt/poetry/bin:$PATH

# Env variable helper script
COPY ./credentials_env_variables.sh /opt/credentials_env_variables.sh

# Use bash by default, not python
CMD source /opt/credentials_env_variables.sh && /opt/poetry/bin/poetry publish --build