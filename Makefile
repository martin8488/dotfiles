.PHONY: brew git gpg hyper nvim sdkman ssh starship vscode zsh
default: .PHONY

bootstrap:
	# ln will fail if repo was already checked out in ~/dotfiles 
	@ln -sfv $(shell pwd -P) ${HOME} || true
#ifeq (,$(wildcard ${HOME}/dotfiles/.profile))
#	@echo "Usage (private/work)?"
#	@read line; echo $$line > ${HOME}/dotfiles/.profile
#endif

brew: bootstrap
	@chmod +x brew/install.sh
	@./brew/install.sh

nvim: bootstrap brew
	@chmod +x nvim/install.sh
	@./nvim/install.sh

zsh: bootstrap brew
	@chmod +x zsh/install.sh
	@./zsh/install.sh
