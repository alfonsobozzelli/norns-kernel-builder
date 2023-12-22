FROM debian:bullseye

# Install build dependencies
RUN apt-get update && apt-get install -y \
  bc \
  bison \
  build-essential \
  crossbuild-essential-armhf \
  curl \
  flex \
  git-core \
  libc6-dev \
  libncurses5-dev \
  libssl-dev \
  kmod

# Cross compile for 64bit arm
ENV CROSS_COMPILE=aarch64-linux-gnu-
ENV ARCH=arm64

# Create working directory
RUN mkdir -p /workdir
WORKDIR /workdir
ENV WORKDIR /workdir
ENV BUILD_DEST /workdir/build

# Add the build script and set it as default command
COPY build-rpi3-kernel /opt/bin/build-rpi3-kernel
CMD ["/opt/bin/build-rpi3-kernel"]
