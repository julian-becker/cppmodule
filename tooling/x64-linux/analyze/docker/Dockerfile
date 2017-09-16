FROM build-linux-x64

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

VOLUME /build
VOLUME /work
WORKDIR /build

CMD find /work/src -name '*.cpp' | xargs clang-tidy -checks=* -p=.
#CMD bash
