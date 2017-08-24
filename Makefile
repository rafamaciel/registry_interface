clean:
	@find . -name "*.pyc" -delete
	@rm -rf registry_interface.egg-info build dist

deps:
	@pip install -r test-requirements.txt

python-test: clean deps
	@coverage run manage.py test
	@coverage report --omit="*/tests/*,manage.py" --include="./*" -m
	@flake8 --max-line-length 130 .

run: clean deps
	@DEBUG=true ./manage.py runserver

node-test: node-deps
	@npm test

test: python-test node-test

node-deps:
	@bash -c 'yarn || (rm -rf node_modules && npm install .)'

build-js: node-deps build-js-only

build-js-only:
	@bash -c 'for i in `find . -regex ".*jsx/pages/.*.js"`; do A=`echo $$i | sed s/jsx/js/g | sed s/pages.//g`; echo "$$i -> $$A"; ./node_modules/browserify/bin/cmd.js -t babelify -t reactify -o $$A $$i; done; echo "Done."'
