# drone-poetry
Drone plugin to build and publish poetry python packages

[![Build Status](https://cloud.drone.io/api/badges/tangibleintelligence/drone-poetry/status.svg)](https://cloud.drone.io/tangibleintelligence/drone-poetry)

## Usage

Example usage in `.drone.yml` file:

```yaml
- name: build and publish
  image: austin1howard/drone-plugin-poetry
  settings:
  	pypi_token: j2asjdfas8djf9823fjkldaf023
    private_repo: https://us-python.pkg.dev/.../.../
    private_repo_poetry_name: google
    private_repo_username: kevinbacon
    private_repo_password: pa55word
```

- `pypi_token` is used to authenticate to pypi when pushing there.
- `private_repo` is a private repo URL (e.g. `https://us-python.pkg.dev/.../.../`). If specified, packages will be pushed there instead of to pypi.
- `private_repo_poetry_name` is the name of the private repo as defined in the pyproject.toml file. If not specified, will be assumed as "private".
- `private_repo_username`/`private_repo_password` are pypi (or compatible private repo) username and password, used for pulling from private repo (if specified) and also publishing to private repo or pypi.
