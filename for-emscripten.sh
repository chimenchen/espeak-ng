# cd ../emsdk && \
# ./emsdk activate latest && \
# source ./emsdk_env.sh && \
# cd - && \
./autogen.sh && \
./configure --without-async --without-mbrola --without-sonic && \
make

cd src/ucd-tools
./autogen.sh
make clean
emconfigure ./configure --disable-shared
emmake make clean
emmake make

cd ../..
# 优先选项可能非必要
emconfigure ./configure --without-async --without-mbrola --without-sonic CFLAGS='-Wuninitialized -Wreturn-type -Wmissing-prototypes -Wint-conversion -Wimplicit -g -O2 -std=c99'
# 多clean，避免链接时出现文件格式不对错误
emmake make clean
cd src/ucd-tools
emmake make
cd ../..
emmake make src/libespeak-ng.la

cd emscripten
emmake make
