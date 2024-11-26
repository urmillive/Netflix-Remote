# Netflix Remote Control Flask App

This is a simple Flask app that allows you to control Netflix video playback on Google Chrome via HTTP requests. You can start and pause the video directly by making requests to the server from your device (e.g., iPhone). The app uses AppleScript to interact with Google Chrome and execute JavaScript on the active Netflix tab.

## Features

- **Play** the video on Netflix from any open Chrome tab that contains a Netflix URL.
- **Pause** the video on Netflix from any open Chrome tab that contains a Netflix URL.
- Easy-to-use API with simple endpoints.

## Prerequisites

Before running the app, ensure you have the following:

- **macOS** operating system.
- **Python 3.x** installed. You can check this by running:
  ```bash
  python3 --version
