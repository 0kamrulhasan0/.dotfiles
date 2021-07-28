#
#	This is Python Project Setup Makefile
#
PROJECT_NAME=$(strip $(notdir $(CURDIR)))
VENV_NAME=.venv
PYTHON=$(VENV_NAME)/bin/python
PIP=$(VENV_NAME)/bin/pip


setup:
	mkdir -p $(PROJECT_NAME) tests docs
	touch $(PROJECT_NAME)/app.py
	printf "mypy\npytest\nblack" > requirements.txt
	printf "__pycache__/\n$(VENV_NAME)/\n.pytest_cache\n" > .gitignore
	virtualenv -p python3 $(VENV_NAME)
	$(PIP) install -U pip
	make install

install: requirements.txt
	$(PIP) install -r requirements.txt

lint:
	$(PYTHON) -m black src tests lib
	$(PYTHON) -m mypy src tests lib

test:
	$(PYTHON) -m pytest

run:
	export PYTHONPATH=$(PROJECT_NAME)
	make lint
	make test
	test -f $(PROJECT_NAME)/app.py && $(PYTHON) $(PROJECT_NAME)/app.py

clean:
	rm -r $(PROJECT_NAME) tests docs $(VENV_NAME) requirements.txt .gitignore
