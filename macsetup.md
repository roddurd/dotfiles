## Setup Script
```zsh
#!/bin/zsh

# Get Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew install formulae
brew install                 \
  git                        \
  koekeishiya/formulae/skhd  \
  koekeishiya/formulae/yabai \
  vim                        \
  zsh-autosuggestions        \
  zsh-syntax-highlighting

# brew install apps
brew install --cask  \
  anki               \
  arc                \
  copyq              \
  discord            \
  docker             \
  fl-studio          \
  obs                \
  rectangle          \
  spotify            \
  visual-studio-code \
  warp
  
# ---- non homebrew stuff ------

# Clone my dotfiles
git clone https://github.com/roddurd/dotfiles.git ~/dotfiles

# Create symbolic links between dotfiles and the home directory
ln -s ~/dotfiles/.skhdrc ~/.skhdrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.yabairc ~/.yabairc
ln -s ~/dotfiles/.zshrc ~/.zshrc


source ~/.zshrc


```

### yabai/skhd setup
`yabai --start-service`
(manually give yabai access and enter password/touch ID)
`skhd --start-service`
(manually give skhd access and enter password/touch ID)

Copy the example configuration into your home directory: ==maybe change this to custom config==
 `cp /opt/homebrew/opt/yabai/share/yabai/examples/yabairc ~/.yabairc`
` cp /opt/homebrew/opt/yabai/share/yabai/examples/skhdrc ~/.skhdrc`

Change sudo so yabai/skhd can run
`echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa"`
paste the output of that into
`sudo visudo -f /private/etc/sudoers.d/yabai`
then `vim ~/.yabairc` and uncomment lines 10-11




### shortcuts and settings
- Keyboard > Keyboard Shortcuts... > Services > Files and Folders > New Terminal At Folder = ctrl + b
	- > Keyboard navigation = On
- Spelling 
	- > Correct spelling automatically = Off
	- > Capitalize words automatically = Off
	- > Add period with double-space = Off 
- Dock > Minimize Windows Using = Scale Effect
	- > Minimize windows into application icon = On
	- > Automatically hide and show the Dock = On
	- > Animate opening applications = Off
	- > Automatically rearrange Spaces based on most recent use = Off
- Terminal > Settings >
	- General > New windows open with: Same Working Directory
- Settings > Keyboard > Keyboard Shortcuts > Mission Control > expand Mission Control
	- check all the Switch to Desktop shortcuts (^1, ^2, etc.)
- Settings > Accessibility > Display > Reduce motion = on

manually install
- davinci resolve

vimrc
- TODO: command to set $MYVIMRC, pull from git into it

zshrc
- 

### vscode extensions/settings
- vim
	- vimrc: enable
	- vim.leader: set to ','
- prettier
- indent-rainbow
	- indicator style > light
	- light indicator style line width > 3
- docker
- python
- settings
	- tree > 
		- indent = 16
		- render indent guides = always
	- word wrap = on
	- zen mode: hide lin numbers = off
	- Terminal > External: Osx Exec = Warp.app


## obsidian extensions/settings
- settings
	- editor > advanced > enable Vim 
	- core plugins
		- enable daily notes
	- hotkeys
		- focus on tab group up/down/left/right
			- cmd + shift + J/K/H/L
		- daily notes: open next/previous/today's
			- cmd + shift + W/Y/D
		- navigate back/forward
			- cmd + \[/\]
		- toggle checkbox status
			- cmd + enter
		- toggle highlight
			- cmd + H
		- toggle sidebar
			- cmd + option + S
	- community plugins
		- vimrc support


## files to move over to personal
- [[Patrick Collison & Sam Altman - Sohn 2023]] 
- [[Mac Setup]] 
- [[Yacine vs Roko on AI Risk - Twitter Space 2023]]
- 

Look into
- [ ] Raycast instead of Spotlight?
- [x] Yabai or Amethyst as TWM for macOS?
- [ ] iTerm2 or other terminals?
	- [ ] warp?
- [ ] helix editor??
- [ ] zshrc
 
