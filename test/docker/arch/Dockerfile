FROM archlinux

WORKDIR /root/
RUN pacman -Syyu --needed --noconfirm
RUN pacman -S vim git typst --needed --noconfirm

RUN mkdir ~/.vim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN echo "call plug#begin()" > ~/.vim/vimrc
RUN echo "    Plug 'harryhanYuhao/typst.vim'" >> ~/.vim/vimrc
RUN echo "call plug#end()" >> ~/.vim/vimrc
RUN vim -c PlugInstall -c :q -c :q
