FROM gcc:7.2.0

RUN apt-get purge cmake
RUN cd `mktemp -d` \
 && wget --quiet -O cmake.tar.gz https://cmake.org/files/v3.9/cmake-3.9.2.tar.gz \
 && tar -xzvf cmake.tar.gz \
 && cd cmake* \
 && ./bootstrap \
 && make -j`nproc` \
 && make install

RUN wget --quiet http://apt.llvm.org/llvm-snapshot.gpg.key -O - | apt-key add - \
        && sh -c 'echo "deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-5.0 main" >> /etc/apt/sources.list' \
        && apt-get update \
        && apt-get -y --quiet --no-install-recommends install \
                clang-5.0 \
                clang-format-5.0 \
                clang-tidy-5.0 \
                llvm-5.0
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-5.0 1 \
 && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-5.0 1 \
 && update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-5.0 1 \
 && update-alternatives --install /usr/bin/clang-check clang-check /usr/bin/clang-check-5.0 1 \
 && update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-5.0 1

RUN mkdir /build

VOLUME /work
VOLUME /install

WORKDIR /build

CMD cmake \
      -DCMAKE_INSTALL_PREFIX:PATH=/install \
      -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON \
      /work \
 && cmake --build . --target install -- -j`nproc`
