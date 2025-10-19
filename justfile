default: olympus

build_image := "cr.eyedevelop.org/olympus_build"

clean:
    rm -rf ./build/

build-container:
    docker build -t {{build_image}} -f build_image/Containerfile build_image/

olympus: build-container
    test -d ./build && rm -rf ./build
    docker run --rm -v ${PWD}:${PWD} -w ${PWD} {{build_image}} cmake -G Ninja -B ./build
    docker run --rm -v ${PWD}:${PWD} -w ${PWD} {{build_image}} cmake --build ./build

olympus-native:
    test -d ./build && rm -rf ./build || :
    cmake -G Ninja -B ./build
    cmake --build build
