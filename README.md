# Zephyr Firmware Sample

## Overview

This project provides instructions for installing Zephyr, Zephyr SDK, and required dependencies, along with steps to build and run a sample Zephyr application.

***

## Directory Structure

- `CMakeLists.txt` — Main CMake configuration file
- `install_deps.sh` — Bash script for installing Zephyr development dependencies
- `prj.conf` — Application-specific Kconfig configuration
- `README.txt` — Project documentation (this file)
- `sample.yaml` — Metadata and test configuration for the sample application
- `src/` — Zephyr application source code

***

## Setup and Running the Application

1. **Activate the Python virtual environment:**

```
source ~/zephyrproject/.venv/bin/activate
```

2. **Export Zephyr environment variables:**

```
source ~/zephyrproject/zephyr/zephyr-env.sh
```

3. **Build the application for QEMU Cortex-M3:**

```
west build -p always -b qemu_cortex_m3 .
```

4. **Run the application in QEMU:**

```
west build -t run
```


***

## Further Information

For detailed reference and troubleshooting, please consult the [Zephyr Project Documentation](https://docs.zephyrproject.org/latest/).

***

**Notes:**

- If targeting a different board, replace `qemu_cortex_m3` with your board’s name in the build command.
- Always activate the virtual environment before running build commands.
- Ensure all dependencies are installed using `install_deps.sh` before starting setup.




