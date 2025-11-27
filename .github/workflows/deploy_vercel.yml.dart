name: Deploy Flutter Web to Vercel

on:
push:
branches:
- master  # change if needed

jobs:
build:
runs-on: ubuntu-latest

steps:
# Checkout repository
- name: Checkout code
uses: actions/checkout@v3

# Install Flutter
- name: Install Flutter
uses: subosito/flutter-action@v2
with:
channel: stable

# Get dependencies
- name: Flutter pub get
run: flutter pub get

# Build Flutter Web
- name: Build Flutter Web
run: flutter build web --release --web-renderer html

# Install Vercel CLI
- name: Install Vercel CLI
run: npm install --global vercel@latest

# Deploy to Vercel
- name: Deploy to Vercel
run: |
vercel deploy --prebuilt --prod \
--token=$VERCEL_TOKEN \
--scope=$VERCEL_ORG_ID \
--confirm
env:
VERCEL_TOKEN: ${{ secrets.VERCEL_TOKEN }}
VERCEL_ORG_ID: ${{ secrets.VERCEL_ORG_ID }}
VERCEL_PROJECT_ID: ${{ secrets.VERCEL_PROJECT_ID }}
