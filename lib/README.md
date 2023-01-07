# Lib

Folder for local Python packages.

Project directories copied into this folder will be pip-installed in the Docker build.

## Example

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
