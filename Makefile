.PHONY: git_config git_ignore dump_git_config dump_git_ignore

git_config:
	@cp ./.config/.gitconfig ~/.gitconfig

git_ignore:
	@cp -r ./.config/git ~/.config/git

dump_git_config:
	@cp ~/.gitconfig ./.config/.gitconfig

dump_git_ignore:
	@cp -r ~/.config/git ./.config/git
