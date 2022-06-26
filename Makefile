.PHONY: help
help: ## Show this usage
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: setup
setup: ## Install fvm.
	dart pub global activate fvm

.PHONY: dependencies
dependencies: ## Install packages.
	fvm install
	fvm flutter clean
	fvm flutter packages pub get

.PHONY: icon
icon: ## Generate Icons
	fvm flutter packages pub run flutter_launcher_icons:main

.PHONY: analyze
analyze: ## Linting
	fvm flutter analyze

.PHONY: format
format: ## Formatting
	fvm flutter format lib/

.PHONY: format-analyze
format-analyze: ## Dry run formatting and linting
	fvm flutter format --dry-run lib/
	fvm flutter analyze

.PHONY: build-runner
build-runner: ## Generate code dynamically with annotations.
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: run-stg
run-stg: ## Run staging app.
	fvm flutter run --flavor staging --dart-define=FLAVOR=staging --target lib/main.dart
	
.PHONY: run-stg-%
run-stg-%: ## Run staging app. Use specific device id.
	fvm flutter run --flavor staging --dart-define=FLAVOR=staging --target lib/main.dart -d ${@:run-stg-%=%}

.PHONY: run-prd-debug
run-prd-debug: ## Run production app. Debug mode.
	fvm flutter run --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: run-prd
run-prd: ## Run production app.
	fvm flutter run --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-apk-stg
build-apk-stg: ## Build staging Android app.
	fvm flutter build apk --flavor staging --dart-define=FLAVOR=staging --target lib/main.dart --obfuscate --split-debug-info=symbols/android/stg/

.PHONY: build-aab-stg
build-aab-stg: ## Build production Android app.
	fvm flutter build appbundle --release --flavor staging --dart-define=FLAVOR=staging --target lib/main.dart --obfuscate --split-debug-info=symbols/android/stg/

.PHONY: build-apk-prd
build-apk-prd: ## Build production Android app.
	fvm flutter build apk --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart --obfuscate --split-debug-info=symbols/android/prd/

.PHONY: build-aab-prd
build-aab-prd: ## Build production Android app.
	fvm flutter build appbundle --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart --obfuscate --split-debug-info=symbols/android/prd/

.PHONY: build-ipa-stg-adhoc
build-ipa-stg-adhoc: ## Build staging iOS ad-hoc type ipa.
	fvm flutter build ipa --release --flavor staging --dart-define=FLAVOR=staging --export-options-plist="ios/ExportOptions/AdHoc/Staging/ExportOptions.plist" --obfuscate --split-debug-info=symbols/ios/stg/

.PHONY: build-ipa-prd-adhoc
build-ipa-prd-adhoc: ## Build production iOS ad-hoc type ipa.
	fvm flutter build ipa --release --flavor production --dart-define=FLAVOR=production --export-options-plist="ios/ExportOptions/AdHoc/Production/ExportOptions.plist" --obfuscate --split-debug-info=symbols/ios/prd/
	
.PHONY: build-ipa-prd-store
build-ipa-prd-store: ## Build production iOS app-store type ipa.
	fvm flutter build ipa --release --flavor production --dart-define=FLAVOR=production --export-options-plist="ios/ExportOptions/AppStore/Production/ExportOptions.plist" --obfuscate --split-debug-info=symbols/ios/prd/

.PHONY: unit-test
unit-test: ## Testing
	fvm flutter test --coverage --coverage-path=./coverage/lcov.info
