help:
	@echo 'Makefile for vim-orgmode                                             '
	@echo '                                                                     '
	@echo 'Usage:                                                               '
	@echo '    clean               remove all tmp files (especially pyc files)  '
	@echo '    test                run the unittests                            '
	@echo '    coverage            generate a coverage report                   '
	@echo '    lint                lint the python files with pylint            '
	@echo '    lintstrict          lint the python files with pylint, be strict '

clean:
	@find . -name \*.pyc -o -name \*.py,cover -exec rm {} \;

# run unittests
test:
	cd tests && python2 run_tests.py

# generate a test coverage report for all python files
coverage:
	@echo ">>> Coverage depends on the package python-nose and python-coverage, make sure they are installed!"
	cd tests && nosetests --with-coverage --cover-html .

# run a static code checker
lint:
	@echo ">>> Lint depends on the package pylint make sure it's installed!"
	pylint --rcfile .pylintrc --disable=C0301,C0103,C0111,C0322,C0323,C0324,W0703,W0612,W0603 orgmode

lintstrict:
	@echo ">>> Lint depends on the package pylint make sure it's installed!"
	pylint --rcfile .pylintrc orgmode
