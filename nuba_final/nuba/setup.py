# setup.py - Install Nuba as a command-line tool

from setuptools import setup, find_packages

setup(
    name="nuba",
    version="1.0.0",
    description="Nuba Programming Language - run .nu files like Python",
    author="Nuba Language Project",
    packages=find_packages(),
    python_requires=">=3.8",
    entry_points={
        "console_scripts": [
            "nuba=nuba_cli:main",
        ],
    },
    package_data={
        "": ["stdlib/*.nu"],
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Topic :: Software Development :: Interpreters",
    ],
)
