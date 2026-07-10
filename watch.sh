
cmake -S . -B .build  -G Ninja && cmake --build .build --config=Debug
while inotifywait -r ./rave -e create,delete,modify; do {
    clear
    cmake -S . -B .build  -G Ninja && cmake --build .build --config=Debug
    echo Built project
}; done
