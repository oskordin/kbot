# kbot

A telegram bot to pass Prometheus DevOps course test

## Features
 - shows app version
 - shows some help
 - connects to Telegram bot
 - responds to message

## Prerequisites

- anything can run linux
- go installed
- Telegram account 
- existing Telegram bot

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/kbot.git
cd kbot
```

2. Set up your Telegram Bot Token:
```bash
export TELE_TOKEN="your_telegram_bot_token"
```

3. Build the application:
```bash
go build -ldflags "-X="github.com/vit-um/kbot/cmd.appVersion=v1.0.3
```

## Usage

Start the bot:
```bash
./kbot go
```

### Available Commands

- `/start test` -Recieve some information from bot


## Development

The project uses Cobra for CLI command management and go-rpio for GPIO control.

### Project Structure

- `cmd/` - Contains the main command implementations
  - `kbot.go` - Main bot implementation and traffic light control
  - `root.go` - Root command configuration
  - `version.go` - Version command implementation

## Versioning

The application version is manually generated as user wishes

## License

This project is licensed under no license