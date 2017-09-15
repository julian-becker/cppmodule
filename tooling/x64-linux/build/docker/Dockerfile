FROM gcc:7.2.0

RUN apt-get purge cmake
RUN cd `mktemp -d` \
 && wget --quiet -O cmake.tar.gz https://cmake.org/files/v3.9/cmake-3.9.2.tar.gz \
 && tar -xzvf cmake.tar.gz \
 && cd cmake* \
 && ./bootstrap \
 && make -j`nproc` \
 && make install

RUN mkdir /build

VOLUME /src
VOLUME /install

WORKDIR /build

CMD cmake -DCMAKE_INSTALL_PREFIX:PATH=/install /src \
 && cmake --build . --target install -- -j`nproc`