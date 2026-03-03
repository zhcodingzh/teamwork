<p align="center">
    <img src="ui/public/logo.svg" width="180" alt="Teamwork Logo" />
</p>

<h1 align="center">Teamwork</h1>

<p align="center">
    Screen sharing for teams — low latency, high quality, WebRTC-based.
</p>

## Features

* Multi-user screen sharing
* WebRTC-based secure transfer
* Built-in TURN server for NAT traversal
* Simple Docker deployment

## Quick Start

```bash
docker run --net=host \
  -e TEAMWORK_EXTERNAL_IP=YOUR_IP \
  huhuhaha5588/teamwork:latest
```

## Configuration

Environment variables are prefixed with `TEAMWORK_`. See `teamwork.config.example` for all options.

## Source

This project is rebranded from an open-source screen sharing project.
