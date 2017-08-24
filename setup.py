from setuptools import setup, find_packages
from registry_interface import __version__

setup(
    name="registry_interface",
    url="https://github.com/rafamaciel/registry_interface",
    version=__version__,
    packages=find_packages(),
    description="A simple interface for Docker registry",
    author="rafamaciel",
    author_email="rafamaciel@protonmail.com",
    include_package_data=True,
    install_requires=[
        "Django>=1.10.6",
        "requests>=2.8.1",
        "python-dateutil>=2.4.2",
        "pytz>=2015.4",
        "Pygments>=2.0.2",
        "grequests>=0.3.0",
        "Pygments>=2.1.3",
        "pymongo>=3.3.0",
        "PyYAML>=3.11",
    ],
)
