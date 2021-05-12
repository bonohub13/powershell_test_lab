FROM archlinux:latest

ARG UNAME
ARG UID
ARG GID

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
    neovim \
    git \
    base-devel
RUN pacman -S --noconfirm go # dependency for yay
RUN pacman -S --noconfirm \
    openssl-1.0 \
    lttng-ust #dependency for powershell-bin

RUN useradd -m -u $UID -g $GID -s /bin/bash $UNAME
RUN echo "root:rootUserPassword" | chpasswd
RUN echo $UNAME":password" | chpasswd
RUN echo $UNAME' ALL=(ALL:ALL) ALL' | EDITOR="tee -a" visudo

# cloning my dotfiles and its dependencies
RUN runuser -l $UNAME -c 'mkdir ~/.config && git clone https://github.com/bonohub13/dotfiles ~/dotfiles'
RUN runuser -l $UNAME -c 'git clone https://github.com/morhetz/gruvbox ~/gruvbox'
RUN runuser -l $UNAME -c 'cp -r ~/dotfiles/nvim ~/.config && cp -r ~/gruvbox/colors ~/.config/nvim'

# cleanup
RUN rm -rf /home/$UNAME/dotfiles /home/$UNAME/gruvbox

# cloning and installing AUR helper and powershell
RUN runuser -l $UNAME -c 'git clone https://aur.archlinux.org/yay ~/yay && cd ~/yay && makepkg -s'
RUN pacman -U --noconfirm /home/$UNAME/yay/yay*tar.zst && rm -rf /home/$UNAME/yay
RUN runuser -l $UNAME -c 'git clone https://aur.archlinux.org/powershell-bin ~/powershell-bin && cd ~/powershell-bin && makepkg -s'
RUN pacman -U --noconfirm /home/$UNAME/powershell-bin/*tar.zst && rm -rf /home/$UNAME/powershell-bin

RUN chsh -s `which pwsh` $UNAME
RUN runuser -l $UNAME -c 'mkdir -p ~/scripts'

USER $UNAME
