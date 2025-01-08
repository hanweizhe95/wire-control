# Define variables for build and output directories
BUILD_DIR="build"
BINARY_DIR="bin"

# Function to clean the build directory
clean() {
    echo "Cleaning build directory..."
    if [ -d "$BUILD_DIR" ]; then
        rm -rf "$BUILD_DIR"
        echo "Build directory cleaned."
    else
        echo "No build directory to clean."
    fi
    echo "Cleaning build directory..."
    if [ -d "$BINARY_DIR" ]; then
        rm -rf "$BINARY_DIR"
        echo "Binary directory cleaned."
    else
        echo "No binary directory to clean."
    fi
}

run() {
    sudo ifconfig can0 down
    sudo ip link set dev can0 type can bitrate 500000 dbitrate 2000000 sample-point 0.8 fd
    sudo ifconfig can0 up
    sudo ifconfig can1 down
    sudo ip link set dev can0 type can bitrate 500000 dbitrate 2000000 sample-point 0.8 fd
    sudo ifconfig can1 up
    ./wire_control
}

for arg in "$@"; do
    case $arg in
        clean)
            clean
            ;;
    esac
done

mkdir -p $BUILD_DIR
cd $BUILD_DIR
qmake ..
make

for arg in "$@"; do
    case $arg in
        run)
            run
            ;;
    esac
done
