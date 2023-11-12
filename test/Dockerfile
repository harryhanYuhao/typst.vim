FROM archlinux

WORKDIR /test

RUN pacman -Syyu --needed --noconfirm
RUN pacman -S vim git typst --needed --noconfirm
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

