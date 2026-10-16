derived_data := ".build/xcode"
app := derived_data / "Build/Products/Debug/Looper.app"

# List the available recipes.
default:
    @just --list

# Generate Looper.xcodeproj from project.yml.
generate:
    xcodegen generate --quiet

# Build the app in Debug.
build: generate
    xcodebuild -project Looper.xcodeproj -scheme Looper -configuration Debug -destination "platform=macOS,arch=$(uname -m)" -derivedDataPath {{derived_data}} -quiet build

# Build and (re)launch the app.
run: build
    -pkill -x Looper
    open {{app}}

# Run the LooperCore tests.
test:
    swift test --package-path Packages/LooperCore

# Configure xcode-build-server so sourcekit-lsp understands the project.
lsp: generate
    xcode-build-server config -project Looper.xcodeproj -scheme Looper

# Remove generated files and build products.
clean:
    rm -rf Looper.xcodeproj .build Packages/LooperCore/.build buildServer.json
