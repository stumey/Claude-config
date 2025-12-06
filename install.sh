#!/bin/bash

# Claude Code Global Configuration Installation Script
# This script installs subagents, skills, and settings to ~/.claude/

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "========================================"
echo "Claude Code Configuration Installer"
echo "========================================"
echo ""

# Determine script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CLAUDE_DIR="$HOME/.claude"

# Create directories if they don't exist
echo -e "${GREEN}Creating directories...${NC}"
mkdir -p "$CLAUDE_DIR/agents"
mkdir -p "$CLAUDE_DIR/skills"

# Count files to install
AGENT_COUNT=$(find "$SCRIPT_DIR/agents" -name "*.md" -o -name "*.yaml" | wc -l | tr -d ' ')
SKILL_COUNT=$(find "$SCRIPT_DIR/skills" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')

echo "Found:"
echo "  - $AGENT_COUNT agents to install"
echo "  - $SKILL_COUNT skills to install"
echo ""

# Backup existing configuration
if [ -d "$CLAUDE_DIR/agents" ] && [ "$(ls -A $CLAUDE_DIR/agents)" ]; then
    BACKUP_DIR="$HOME/claude-backup-$(date +%Y%m%d-%H%M%S)"
    echo -e "${YELLOW}Backing up existing configuration to: $BACKUP_DIR${NC}"
    mkdir -p "$BACKUP_DIR"
    cp -r "$CLAUDE_DIR/agents" "$BACKUP_DIR/" 2>/dev/null || true
    cp -r "$CLAUDE_DIR/skills" "$BACKUP_DIR/" 2>/dev/null || true
    cp "$CLAUDE_DIR/settings.json" "$BACKUP_DIR/" 2>/dev/null || true
    echo -e "${GREEN}Backup created successfully${NC}"
    echo ""
fi

# Install agents
echo -e "${GREEN}Installing agents...${NC}"
if [ -d "$SCRIPT_DIR/agents" ]; then
    cp -r "$SCRIPT_DIR/agents/"* "$CLAUDE_DIR/agents/"
    echo -e "${GREEN}✓ Installed $AGENT_COUNT agents${NC}"
else
    echo -e "${RED}Error: agents directory not found${NC}"
    exit 1
fi

# Install skills
echo -e "${GREEN}Installing skills...${NC}"
if [ -d "$SCRIPT_DIR/skills" ]; then
    cp -r "$SCRIPT_DIR/skills/"* "$CLAUDE_DIR/skills/"
    echo -e "${GREEN}✓ Installed $SKILL_COUNT skills${NC}"
else
    echo -e "${RED}Error: skills directory not found${NC}"
    exit 1
fi

# Install settings (with caution)
if [ -f "$SCRIPT_DIR/settings.json" ]; then
    if [ -f "$CLAUDE_DIR/settings.json" ]; then
        echo ""
        echo -e "${YELLOW}settings.json already exists.${NC}"
        echo "Your current settings have been backed up."
        echo "You can manually merge settings from:"
        echo "  Source: $SCRIPT_DIR/settings.json"
        echo "  Current: $CLAUDE_DIR/settings.json"
        echo "  Backup: $BACKUP_DIR/settings.json"
    else
        cp "$SCRIPT_DIR/settings.json" "$CLAUDE_DIR/settings.json"
        echo -e "${GREEN}✓ Installed settings.json${NC}"
    fi
fi

# Summary
echo ""
echo "========================================"
echo -e "${GREEN}Installation Complete!${NC}"
echo "========================================"
echo ""
echo "Installed to: $CLAUDE_DIR"
echo ""
echo "Summary:"
echo "  ✓ $AGENT_COUNT agents in ~/.claude/agents/"
echo "  ✓ $SKILL_COUNT skills in ~/.claude/skills/"
echo ""
echo "Verify installation:"
echo "  ls -la ~/.claude/agents/"
echo "  ls -la ~/.claude/skills/"
echo ""
echo "Usage:"
echo "  - List agents: /agents"
echo "  - List skills: /skills"
echo ""

if [ -n "$BACKUP_DIR" ]; then
    echo -e "${YELLOW}Your previous configuration was backed up to:${NC}"
    echo "  $BACKUP_DIR"
    echo ""
fi

echo "Done! 🚀"
