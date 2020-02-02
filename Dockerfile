FROM alchemy_furnace:python

COPY ./resource/.vimrc /root/.vimrc
COPY install_vim.sh /tmp/install_vim.sh 

RUN chmod +x /tmp/install_vim.sh && \
    ./tmp/install_vim.sh
