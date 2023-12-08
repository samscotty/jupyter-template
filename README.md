# Template Jupyter Notebook Environment

Repository template for creating Dockerised Jupyter environments.

## Usage

### New project set up

Create a new repository from the template.

Update the README with information about the project.

### Managing dependencies

Update the [requirements file](requirements.txt) to manage additional third-party package dependencies specific to your project.

For local project installs, copy the directories of your packages into the [`lib`](lib/) folder:

```sh
lib
├── README.md
└── my-package
    ├── pyproject.toml
    ├── README.md
    ├── my_package
    │   ├── __init__.py
    │   └── my_module.py
    └── tests
        ├── __init__.py
        └── test_my_module.py
```

Additional dependencies will be pip-installed in the Docker build.

### Starting the container

Build the Docker image:

```sh
docker build -t jupyter-project .
```

Run the Docker container:

```sh
docker run --rm \
    -p 8888:8888 \
    -v $PWD/project:/home/jovyan/work \
    -w "/home/jovyan/work" \
    -h "localhost" \
    -e JUPYTER_DATA_FOLDER="/home/jovyan/work/data" \
    jupyter-project
```

## Notes

The Dockerfile uses the latest version of the `jupyter/scipy-notebook` base image from Jupyter Docker Stacks.

```dockerfile
ARG BASE_IMAGE=jupyter/scipy-notebook:latest
```
