FROM ubuntu AS base

RUN apt-get update -y


FROM base as builder

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y bison build-essential cmake flex git


FROM builder as chuffed-builder

WORKDIR /chuffed

RUN git clone https://github.com/chuffed/chuffed . && \
    git checkout develop

# Build Chuffed and install it into /install.
RUN mkdir /install && mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/install .. && \
    cmake --build . --config Release && \
    cmake --build . --config Release --target install


FROM builder AS ortools-builder

COPY archives/or-tools-9.5.tar.gz .

RUN tar -xf or-tools-9.5.tar.gz

WORKDIR /or-tools-9.5

# Build OR Tools and install it into /install.
RUN mkdir /install && cmake -S. -Bbuild -DBUILD_DEPS:BOOL=ON && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/install .. && \
    cmake --build . --config Release && \
    cmake --build . --config Release --target install


FROM base AS minizinc

RUN apt-get install -y minizinc

COPY --from=chuffed-builder /install /chuffed

COPY --from=ortools-builder /install /ortools

RUN mkdir $HOME/.minizinc/ && \
    echo '{"mzn_solver_path": [' > $HOME/.minizinc/Preferences.json && \
    echo '"/chuffed/share/minizinc/solvers",' >> $HOME/.minizinc/Preferences.json && \
    echo '"/ortools/share/minizinc/solvers",' >> $HOME/.minizinc/Preferences.json && \
    echo ']}' >> $HOME/.minizinc/Preferences.json