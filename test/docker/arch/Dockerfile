FROM archlinux

WORKDIR /root/
RUN pacman -Syyu --needed --noconfirm
RUN pacman -S vim git typst --needed --noconfirm

RUN mkdir ~/.vim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN curl -fLo ~/.vim/vimrc --create-dirs https://raw.githubusercontent.com/harryhanYuhao/typst.vim/main/test/minimalVimrc 
RUN vim -c PlugInstall -c :q -c :q
