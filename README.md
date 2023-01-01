# Template Jupyter Notebook Environment

Repository template for creating Dockerised Jupyter environments.

## Usage

Create a new repository from the template.

Update the requirements file to manage additional package dependencies specific to the project.
Additional dependencies will be pip-installed in the Docker build.

Build the Docker image:

```dockerfile
docker build -t jupyter .
```

Run the Docker container in detached mode:

```dockerfile
docker run -d --rm -p 8888:8888 -v $PWD/app:/home/jovyan --hostname $USER jupyter
```
