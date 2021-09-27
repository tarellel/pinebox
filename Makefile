BUNDLE_BIN	:= ./bin/bundle
YARN_BIN		:= ./bin/yarn


all: help

docs:
	make -i .sord
	rails erd

help:
	@echo "Tasks:"
	@echo "  docs - Generate application based documentation (Sord (Yardocs and Sorbet) and Applicaiton ERD)"
	@echo "  clean - remove lock files for yarn and bundler"
	@echo "  setup - install ruby and yarn dependencies"
	@echo "  lint - run brakeman, rubocop, and a handful of linters against your code"
	@echo "  docker/dev - setup docker SQLserver test database"
	@echo "  docker/db_console - open SQLserver CLI console for SQLserver test database"
	@echo "  rpsec - Run rspec using parellel tests"

clean:
	$(BUNDLE_BIN) exec rails assets:clobber
	$(BUNDLE_BIN) exec rails log:clear
	$(BUNDLE_BIN) exec rails tmp:clear

#  the -i flag used to prevent the make tasks from failing when one of them reports errors
lint:
	make -i .brakeman
	make -i .fasterer
	make -i .rubocop
	make -i .scss_lint
	make -i .slim_lint
	make -i .sord

setup: .ruby-dependencies .yarn-dependencies

rspec:
	bundle exec rspec --profile 10 --format progress

tsc:
	bin/yarn tsc

tsc_help:
	bin/yarn tsc --help

tsc_setup:
	bin/yarn tsc --init


#############################################
# Used to install application specific dependencies
#############################################
.ruby-dependencies:
	gem install bundler
	$(BUNDLE_BIN) install

.yarn-dependencies:
	rm -rf node_modules
	$(YARN_BIN) install

#############################################
# Linters
#############################################
.brakeman:
	$(BUNDLE_BIN) exec brakeman

.fasterer:
	$(BUNDLE_BIN) exec fasterer

.best_practices:
	$(BUNDLE_BIN) exec rails_best_practices -f html .

.rubocop:
	$(BUNDLE_BIN) exec rubocop

.scss_lint:
	$(BUNDLE_BIN) exec scss-lint
.slim_lint:
	$(BUNDLE_BIN) exec slim-lint ./app/**/*.slim

.sord:
	$(BUNDLE_BIN) exec sord defs.rbi
