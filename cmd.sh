#!/bin/bash

build() {
    printer "🔨 Building the app"
    mkdir -p dist
    rm -rf dist/*
    cp -r app/menu.html dist
    handler
}

deploy() {
    printer "📦 Deploying the app"
    build
    rm -rf dist/*
    cp -r app dist
    git add .
    git commit -m "Deployed the app"
    git push
    handler
}

printer() {
    echo ""
    echo $1
    echo ""
}

handler() {
    if [ $? -eq 0 ]; then
        printer "✅ Process completed successfully"
    else
        printer "❌ An error occurred during the process"
        exit 1
    fi
}

case $1 in
    build)
        build
        ;;
    deploy)
        deploy
        ;;
    *)
        echo "Usage: $0 {build|deploy}"
        ;;
esac
