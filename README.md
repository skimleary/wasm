<div align="center">
<h2>Rust, JavaScript, and WebAssembly</h2>
<p>
<a href="https://www.meetup.com/Charlottesville-Rust-Meetup/"><img src="doc/logo--Charlottesville_Rust_Meetup-blue.svg" width="179" height="20"></a>
<img src="doc/docs-lacking-red.svg" width="84" height="20">
<img src="doc/demos-working-green.svg" width="100" height="20">
<img src="doc/contributions-welcome-brightgreen.svg" width="140" heigt="20">
</p>
</div>

## Examples
The following examples were taken from the [Rust Wasm Tutorial](https://www.raspberrypi.org/products/raspberry-pi-pico/) ordered by complexity

- 01-hello_world
- 02-dom
- 03-canvas
- 04-julia_set
- 05-webaudio
- 06-mandelbrot
- 07-game_of_life
- 08-qemu_tock

We use them here to demonstrate building from Rust sources to WASM targets.

The example, 06-mandelbrot, comes from the book [Rust in Action](https://www.manning.com/books/rust-in-action),
where the program is modified piecemeal to show the wasm-bindgen interface.





The [Raspberry Pi Pico](https://www.raspberrypi.org/products/raspberry-pi-pico/) is a
board developed by the Raspberry Pi Foundation and is based on the RP2040 chip.

## Getting Started

First, follow the [Tock Getting Started guide](../../doc/Getting_Started.md)

## Flashing the kernel

The Raspberry Pi Pico can be programmed via an SWD connection, which requires the Pico to be connected to a regular Raspberry Pi device that exposes the necessary pins. The kernel is transferred to the Raspberry Pi Pico using a [custom version of OpenOCD](https://github.com/raspberrypi/openocd).

### Raspberry Pi Setup

To install OpenOCD on the Raspberry Pi run the following commands on the Pi:
```bash
$ sudo apt-get update
$ sudo apt install automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev git
$ git clone https://github.com/raspberrypi/openocd.git --recursive --branch rp2040 --depth=1
$ cd openocd
$ ./bootstrap
$ ./configure --enable-ftdi --enable-sysfsgpio --enable-bcm2835gpio
$ make -j4
$ sudo make install
$ cd ~
```

Enable SSH on the Raspberry Pi by following the [instructions on the Raspberry Pi website](https://www.raspberrypi.org/documentation/remote-access/ssh/).

Next, connect the SWD pins of the Pico (the tree lower wires) to GND, GPIO 24, and GPIO 25 of the Raspberry Pi. You can follow the schematic in the [official documentation](https://datasheets.raspberrypi.org/pico/getting-started-with-pico.pdf#%5B%7B%22num%22%3A22%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2C115%2C431.757%2Cnull%5D) and connect the blue, black, and purple wires.

Also connect the other three wires as shown in the schematic, which will connect the Pico UART to the Raspberry Pi. This will enable the serial communication between the two devices.
### Flash the tock kernel

`cd` into `boards/raspberry_pi_pico` directory and run:

```bash
$ make

(or)

$ make debug
```

Connect via ssh to the Raspberry Pi and forward port 3333. Then start OpenOCD on the Pi.
```bash
$ ssh pi@<pi_IP> -L 3333:localhost:3333

(wait to connect)

$ openocd -f interface/raspberrypi-swd.cfg -f target/rp2040.cfg
```
You can also open a serial console on the Raspberry Pi for debug messages.
```bash
$ sudo apt install minicom
$ minicom -b 115200 -o -D /dev/serial0
```

On the local computer use gdb-multiarch on Linux or arm-none-eabi-gdb on MacOS to deploy tock.
```bash
$ arm-none-eabi-gdb tock/target/thumbv6m-none-eabi/release/raspberry_pi_pico.elf
(gdb) target remote :3333
(gdb) load
(gdb) continue
```
## Flashing app

Apps are built out-of-tree. Once an app is built, you can add the path to it in the Makefile (APP variable), then run:
```bash
$ make program
```

This will generate a new ELF file that can be deployed on the Raspberry Pi Pico via gdb and OpenOCD as described in the [section above](#flash-the-tock-kernel).
