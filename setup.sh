#!/bin/bash

set -eou pipefail

# Ensure Xcode Command Line Tools is installed
xcode-select --install

# Installing Homebrew:
# https://brew.sh/
# https://mac.install.guide/homebrew/3.html
if [[ $(brew) =~ "command not found" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# On Apple Silicon machines, add Homebrew to your PATH in ~/.zprofile
if [[ $(sysctl -n machdep.cpu.brand_string) =~ "Apple" ]]; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Verify Homebrew installation
if [[ ! $(brew doctor) =~ "Your system is ready to brew" ]]; then
  echo "Verify Homebrew installation"
  return 1
fi

# Installing Ansible
brew install ansible

# Running Ansible playbook with my configurations
ansible-playbook -v main.yml
