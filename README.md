# YouTube Audio Streamer Script

## Overview

This script allows users to search for songs on YouTube by entering the song name and stream their audio using either `mpv` or `ncmpcpp`. It utilizes `yt-dlp` to search for and extract audio from YouTube videos and then streams the audio using the specified player.

## Prerequisites

- **yt-dlp**: A command-line program to download videos from YouTube. It is used to search for and extract audio from YouTube videos.
- **mpv or ncmpcpp**: Either `mpv` or `ncmpcpp` is required to stream the audio. If both are available, `mpv` will be used by default, but `ncmpcpp` can be used if `mpv` is not available.

## Usage

1. Run the script.
2. Enter the name of the song you want to listen to when prompted by `dmenu`.
3. The script will search YouTube for the song, extract its audio, and stream it using the specified player.

### Special Command

- **stop-song**: Entering "stop-song" in the song name prompt will stop the current playback and terminate the script.

## Script Structure

- **Function Definitions**: The script defines a function `display_error` to display error messages and exit the script.
- **Prerequisites Check**: It checks if `yt-dlp` and either `mpv` or `ncmpcpp` are installed. If any of them are missing, it displays an error message and exits.
- **Input**: It prompts the user to enter the song name using `dmenu`.
- **Stop Command Check**: If the entered song name is "stop-song", it stops the current playback and terminates the script.
- **Search and Extraction**: It uses `yt-dlp` to search for the song on YouTube, extract its audio, and obtain the audio URL.
- **Streaming**: Depending on the availability of `mpv` or `ncmpcpp`, it streams the audio using the specified player.

## Future Improvements

- **Error Handling**: Implement more robust error handling and informative error messages.
- **User Interface**: Enhance the user interface with a more user-friendly input method.
- **Playlist Support**: Add support for playing playlists from YouTube.
- **Customization**: Allow users to customize playback options such as audio quality and buffering duration.
- **Integration**: Integrate with other music players or streaming services for wider compatibility.
