# Copyright (C) 2015 Mark Blakeney. This program is distributed under
# the terms of the GNU General Public License.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or any
# later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License at <http://www.gnu.org/licenses/> for more
# details.

NAME = gnucash-select

SHELLCHECK_OPTS = -eSC2053,SC2064,SC2086,SC1117,SC2162,SC2181,SC2034,SC1090,SC2115

check:
	ruff check $(NAME)
	mypy $(NAME)
	vermin -vv --no-tips -i $(NAME)
	shellcheck $(SHELLCHECK_OPTS) $(NAME)-setup

install:
	@./$(NAME)-setup -d "$(DESTDIR)" install

uninstall:
	@./$(NAME)-setup -d "$(DESTDIR)" uninstall

doc:
	update-readme-usage

clean:
	rm -rf __pycache__ *.pyc
