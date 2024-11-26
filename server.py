from flask import Flask
import os

app = Flask(__name__)

# Function to play video on Netflix in any tab across all Chrome windows


@app.route('/start')
def start_video():
    os.system("""
    osascript -e '
    tell application "Google Chrome"
        repeat with win in windows
            repeat with t in tabs of win
                if URL of t contains "netflix.com" then
                    tell t to execute javascript "document.querySelector(\\\"video\\\").play();"
                    return
                end if
            end repeat
        end repeat
    end tell'
    """)
    return "Started Netflix video"

# Function to pause video on Netflix in any tab across all Chrome windows


@app.route('/pause')
def pause_video():
    os.system("""
    osascript -e '
    tell application "Google Chrome"
        repeat with win in windows
            repeat with t in tabs of win
                if URL of t contains "netflix.com" then
                    tell t to execute javascript "document.querySelector(\\\"video\\\").pause();"
                    return
                end if
            end repeat
        end repeat
    end tell'
    """)
    return "Paused Netflix video"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=7222)
