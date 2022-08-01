#!/usr/bin/env bash
set -ex
#USAGE=$(cat "${HOME}"/dotfiles/.profile)


# install zsh, if not installed already
if [ -z "${ZSH}" ] || ! [ -d "${ZSH}" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

  # set zsh as default shell
  chsh -s /bin/zsh

  # load zsh
  exec /bin/zsh
fi

# upgrade zsh, command will fail if no update is available
sh "$ZSH/tools/upgrade.sh" || true

install oh-my-zsh
rm -Rf "${HOME}"/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && exit

install powerline10k
rm -Rf "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom/themes/powerlevel10k

# create symlink
ln -sfv "${HOME}"/dotfiles/zsh/.p10k.zsh "${HOME}"
ln -sfv "${HOME}"/dotfiles/zsh/.zshrc "${HOME}"

# restart zsh to apply latest configuration
exec /bin/zsh
