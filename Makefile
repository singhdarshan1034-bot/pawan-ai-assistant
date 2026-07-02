.PHONY: help clean get build-debug build-release build-all install-debug install-release test lint analyze

help:
	@echo "Pawan AI Assistant - Flutter Build Commands"
	@echo "============================================"
	@echo ""
	@echo "Available targets:"
	@echo "  make get              - Get dependencies"
	@echo "  make clean            - Clean build files"
	@echo "  make build-debug      - Build debug APK"
	@echo "  make build-release    - Build release APK"
	@echo "  make build-all        - Build both debug and release APKs"
	@echo "  make install-debug    - Build and install debug APK"
	@echo "  make install-release  - Build and install release APK"
	@echo "  make test             - Run tests"
	@echo "  make lint             - Run lint analysis"
	@echo "  make analyze          - Analyze code"
	@echo ""

get:
	@echo "Getting dependencies..."
	flutter pub get

clean:
	@echo "Cleaning build files..."
	flutter clean

build-debug: clean get
	@echo "Building debug APK..."
	flutter build apk --debug
	@echo "✅ Debug APK built: build/app/outputs/flutter-app/debug/app-debug.apk"

build-release: clean get
	@echo "Building release APK..."
	flutter build apk --release
	@echo "✅ Release APK built: build/app/outputs/flutter-app/release/app-release.apk"

build-all: clean get
	@echo "Building all APKs..."
	@echo "1. Building debug APK..."
	flutter build apk --debug
	@echo "✅ Debug APK: build/app/outputs/flutter-app/debug/app-debug.apk"
	@echo ""
	@echo "2. Building release APK..."
	flutter build apk --release
	@echo "✅ Release APK: build/app/outputs/flutter-app/release/app-release.apk"

install-debug: build-debug
	@echo "Installing debug APK..."
	flutter install --debug

install-release: build-release
	@echo "Installing release APK..."
	flutter install --release

test:
	@echo "Running tests..."
	flutter test

lint:
	@echo "Running lint analysis..."
	flutter analyze

analyze: lint
	@echo "Code analysis complete"
