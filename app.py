from flask import Flask

import os

app = Flask(__name__)


@app.route('/start')
def start_video():
    os.system("""
    osascript -e 'tell application "Google Chrome"
        execute front window's active tab javascript "document.querySelector(\\"video\\").play()"
    end tell'
    """)
    return "Started"


@app.route('/pause')
def pause_video():
    os.system("""
    osascript -e 'tell application "Google Chrome"
        execute front window's active tab javascript "document.querySelector(\\"video\\").pause()"
    end tell'
    """)
    return "Paused"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=7222)
