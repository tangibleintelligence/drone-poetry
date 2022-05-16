FROM python:3.9

# Poetry version...also used as version to plugin
ENV POETRY_VERSION=1.1.13
ENV POETRY_HOME=/opt/poetry

# Install poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add to path
ENV PATH=/opt/poetry/bin:$PATH

# copy in scripts
COPY ./credentials_env_variables.sh /opt/credentials_env_variables.sh
COPY ./run-poetry.sh /opt/run-poetry.sh
RUN chmod 744 /opt/run-poetry.sh

# Use bash by default, not python, and should run defining vars and publishing/building with poetry
CMD /opt/run-poetry.sh