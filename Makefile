.PHONY: all run_unit clean upgrade lint format help watch gen purge 

all: lint format run

# Adding a help file: https://gist.github.com/prwhite/8168133#gistcomment-1313022
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

run_unit: ## Runs unit tests
	@echo "╠ Running the tests"
	@fvm flutter test || (echo "Error while running tests"; exit 1)

clean: ## Cleans the environment
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@fvm flutter clean
	@fvm flutter pub get

df: ## Run build runner and delete conflict
	@echo "╠ Run build runner and delete conflict..."
	@fvm flutter pub run build_runner build --delete-conflicting-outputs

gen: ## Generates the assets
	@echo "╠ Generating the assets..."
	@fvm flutter pub get
	@fvm flutter packages pub run build_runner build

format: ## Formats the code
	@echo "╠ Formatting the code"
	@dart format lib .
	@fvm flutter pub run import_sorter:main
	@fvm flutter format lib

lint: ## Lints the code
	@echo "╠ Verifying code..."
	@fvm dart analyze . || (echo "Error in project"; exit 1)

upgrade: clean ## Upgrades dependencies
	@echo "╠ Upgrading dependencies..."
	@fvm flutter pub upgrade

run: ## Run main.dart
	@fvm flutter run -t lib/main.dart

purge: ## Purges the fvm Flutter 
	@pod deintegrate
	@fvm flutter clean
	@fvm flutter pub get

	