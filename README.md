# Ansible MacOS Playbook

This is the playbook I use after a clean install of MacOS to set everything up.

## Roles/Tasks

- Installs Homebrew packages and app casks (Role homebrew)
- Installs App Store apps with mas-cli (Role mas)
- Modifies MacOS settings (Role settings)
- Changes the user shell, if configured (Role shell)
- In the hosts it auto-discover Python interpreter

## Installation

1. Run `setup.sh` to run pre-installations and then the ansible playbook

```
# You can do the setup manually if preferred:

# Install Homebrew:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Ansible can be installed one of two ways:
  # With [homebrew](https://formulae.brew.sh/formula/ansible)
  brew install ansible

  # With [pip](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible)
  pip3 install ansible

# If I want to override some of the configurations, I can create a config.yml file and specify the ones I want
cp default.config.yml config.yml # and change the ones you need

# Review the changes the playbook will apply
ansible-playbook --check main.yml

# Actually apply them
ansible-playbook main.yml
```

## References

[Jerome Gamez config repo](https://github.com/jeromegamez/ansible-macos-playbook)
[Gerling Guy config repo](https://github.com/geerlingguy/mac-dev-playbook)
[MacOS configs](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
[Ansible Docs](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible)
[Homebrew Mac installation](https://mac.install.guide/homebrew/3.html)
[Starship prompt](https://github.com/starship/starship)
