.PHONY: zshrc dump_zshrc git_config dump_git_config git_ignore dump_git_ignore code_settings_json dump_code_settings_json all dump_all

zshrc:
	@rsync -au ./.zshrc ~/
	@[ -e ~/.hushlogin ] || touch ~/.hushlogin

dump_zshrc:
	@rsync -au ~/.zshrc ./

git_config:
	@rsync -au ./.config/.gitconfig ~/

dump_git_config:
	@rsync -au ~/.gitconfig ./.config/

git_ignore:
	@rsync -au ./.config/git/ignore ~/.config/git/

dump_git_ignore:
	@rsync -au ~/.config/git/ignore ./.config/git/

code_settings_json:
	@rsync -au ./.config/.vscode/settings.json ~/Library/Application\ Support/Code/User/

dump_code_settings_json:
	@rsync -au ~/Library/Application\ Support/Code/User/settings.json ./.config/.vscode/

all: zshrc git_ignore code_settings_json

dump_all: dump_zshrc dump_git_ignore dump_code_settings_json
