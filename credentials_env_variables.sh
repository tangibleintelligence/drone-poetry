# Defines env variables based on settings

if [[ -z "${PLUGIN_PRIVATE_REPO}" ]]; then
	# No private repo.
	:
else
	# Private repo defined. What's it called?
	if [[ -z "${PLUGIN_PRIVATE_REPO_POETRY_NAME}" ]]; then
		# Empty. assume "private"
		export PLUGIN_PRIVATE_REPO_POETRY_NAME="private"
	fi

	# Set creds and url for private repo
	export POETRY_REPOSITORIES_${PLUGIN_PRIVATE_REPO_POETRY_NAME^^}_URL=${PLUGIN_PRIVATE_REPO}
	export POETRY_HTTP_BASIC_${PLUGIN_PRIVATE_REPO_POETRY_NAME^^}_USERNAME=${PLUGIN_PRIVATE_REPO_USERNAME}
	export POETRY_HTTP_BASIC_${PLUGIN_PRIVATE_REPO_POETRY_NAME^^}_PASSWORD=${PLUGIN_PRIVATE_REPO_PASSWORD}

	# Also add repo for pushing
	export PUBLISH_REPO_CMDLINE=" -r ${PLUGIN_PRIVATE_REPO_POETRY_NAME}"
fi

# Pypi token (if specified)
export POETRY_PYPI_TOKEN_PYPI=${PLUGIN_PYPI_TOKEN}