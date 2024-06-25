FROM ubuntu:latest as dev 

ENV LANG C.UTF-8

ARG USERNAME=ubuntu

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive \
	&& apt-get install -y --no-install-recommends \
	curl \
	ca-certificates \
	git \
	build-essential \
	wget \
	xclip \
	openssh-server \
	unzip \ 
	libffi-dev \
	libffi8ubuntu1 \
	libgmp-dev \
	libgmp10 \
	libncurses-dev \
	zlib1g-dev \
    	libpq-dev \ 
    	ripgrep \
    	fd-find \ 
	python3



# install neovim
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz \
	&& rm -rf /opt/nvim \
	&& tar -C /opt -xzf nvim-linux64.tar.gz 

ENV PATH /opt/nvim-linux64/bin:$PATH

# installs nvm (Node Version Manager) and nodejs
RUN mkdir /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 20.13.1
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH


# Install lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') \
	&& curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
	&& tar xf lazygit.tar.gz lazygit \
	&& install lazygit /usr/local/bin \
	&& mkdir -p /home/$USERNAME/.config/lazygit \
	&& touch /home/$USERNAME/.config/lazygit/config.yml


# set permissions
RUN chown -R $USERNAME /home/$USERNAME

# set user
USER $USERNAME

# Install oh-my-bash
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# install ghcup
RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_GHC_VERSION=9.6.5 sh

ENV PATH /home/$USERNAME/.ghcup/bin:$PATH

# install hls (manually required for now)
RUN ghcup install hls 2.8.0.0

# install ghcid
RUN stack install ghcid 
ENV PATH /home/$USERNAME/.local/bin:$PATH

# install elm
RUN npm install -g elm elm-format 

# setup git
RUN git config --global user.name michael 
RUN git config --global user.email eblakem@gmail.com


WORKDIR /home/$USERNAME/devcontainer

# cmd 
CMD /bin/bash 

