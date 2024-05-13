#!/bin/bash

# Function to display an error message and exit
display_error() {
    echo "Error: $1"
    exit 1
}

# Check if yt-dlp and mpv/ncmpcpp are installed
command -v yt-dlp >/dev/null 2>&1 || display_error "yt-dlp is not installed"
command -v mpv >/dev/null 2>&1 || command -v ncmpcpp >/dev/null 2>&1 || display_error "mpv or ncmpcpp is not installed"

# Accept input using dmenu
song_name=$(echo "" | dmenu -p "Enter song name:")

# Check if the input is "stop-song"
if [ "$song_name" == "stop-song" ]; then
    echo "Stopping current song..."
    pkill -f "mpv|ncmpcpp"  # Terminate mpv or ncmpcpp process if running
    exit 0
fi

# Search YouTube for the song
echo "Searching YouTube for: $song_name"
video_url=$(yt-dlp -g "ytsearch:$song_name" 2>/dev/null | sed -n '2p')
echo "YouTube URL: $video_url"

# Check if the search returned a valid URL
if [ -z "$video_url" ]; then
    display_error "Could not find the song on YouTube"
fi

# Extract audio
echo "Extracting audio..."
audio_url=$(yt-dlp -g -f bestaudio "$video_url" 2>/dev/null)
echo "Audio URL: $audio_url"

# Check if audio extraction was successful
if [ -z "$audio_url" ]; then
    display_error "Could not extract audio from YouTube video"
fi

# Stream audio using mpv or ncmpcpp
if command -v mpv >/dev/null 2>&1; then
    mpv "$audio_url"
elif command -v ncmpcpp >/dev/null 2>&1; then
    ncmpcpp --server "${audio_url%%.*}" --host "${audio_url#*.}"
fi
