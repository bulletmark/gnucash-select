NAME = $(shell basename $(CURDIR))
PYFILES = $(NAME)

check:
	ruff check $(PYFILES)
	mypy $(PYFILES)
	vermin -vv --no-tips -i $(PYFILES)

build:
	rm -rf dist
	python3 -m build --sdist --wheel

upload: build
	uv-publish

doc:
	update-readme-usage

format:
	ruff check --select I --fix $(PYFILES) && ruff format $(PYFILES)

clean:
	@rm -vrf *.egg-info .venv/ build/ dist/ __pycache__/
