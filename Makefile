PIPENV=.venv
PYTHON_VERSION=3.6.7


.PHONY: all install test dev lint pytest

all: install

install:
	env PIPENV_VENV_IN_PROJECT=$(PIPENV) pipenv --python $(PYTHON_VERSION)
	pipenv run python -m pip install -U pip==19.1.1
	pipenv install

test: $(PIPENV) lint pytest

dev: install
	pipenv install -d

lint:
	pipenv run pylint -j 4 my-project

pytest:
	pipenv run env pytest tests/

.PHONY: clean

clean:
	rm -rf $(PIPENV)
