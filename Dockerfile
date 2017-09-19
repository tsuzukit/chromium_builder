FROM ubuntu:14.04

# Install Chromium build dependencies.
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty multiverse" >> /etc/apt/sources.list # && dpkg --add-architecture i386
RUN apt-get update && apt-get install -qy git build-essential clang curl

WORKDIR /root

# Install Chromium's depot_tools.
ENV DEPOT_TOOLS /root/depot_tools
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git $DEPOT_TOOLS
ENV PATH $PATH:$DEPOT_TOOLS
RUN echo -e "\n# Add Chromium's depot_tools to the PATH." >> .bashrc
RUN echo "export PATH=\"\$PATH:$DEPOT_TOOLS\"" >> .bashrc

# Download Chromium sources.
RUN fetch --nohooks --no-history chromium
RUN /root/src/build/install-build-deps.sh --no-prompt --no-arm --no-chromeos-fonts --no-nacl

WORKDIR /root/src

# Create output folder
RUN gclient runhooks
RUN gn gen out/Default