FROM jupyter/datascience-notebook
MAINTAINER "gerritgr"

RUN git clone https://github.com/gerritgr/BD-Reduction/
RUN julia BD-Reduction/install.jl
RUN cp BD-Reduction/main.ipynb main.ipynb
RUN cp BD-Reduction/visualization.ipynb visualization.ipynb
RUN cp -R BD-Reduction/rust/ rust/
RUN rm -rf BD-Reduction/

# Get Rust https://stackoverflow.com/questions/49676490/when-installing-rust-toolchain-in-docker-bash-source-command-doesnt-work
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc


# compile with (within the folder of Dockerfile):  docker build -t gerritgr/BD-Reduction . 
# start with: docker run -p 10000:8888 gerritgr/BD-Reduction   # at my PC the default port doesn't work
