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
The examples that follow are used to demonstrate building from Rust sources to WebAssembly (Wasm) targets using various different methods, and to show the underlying interfaces that bridge the JavaScript <-> Rust|Wasm domains.

* From the Mozilla Foundation
  * [00-asmjs](00-asmjs)
* From the [Rust Wasm Tutorial](https://www.raspberrypi.org/products/raspberry-pi-pico/) ordered by complexity
  * [01-hello_world](01-hello_world)
  * [02-dom](02-dom)
  * [03-canvas](03-canvas)
  * [04-julia_set](04-julia_set)
  * [05-webaudio](05-webaudio)
* From the book [Rust in Action](https://www.manning.com/books/rust-in-action), where the program is modified piecemeal to show the wasm-bindgen interface
  * [06-mandelbrot](06-mandelbrot)
  * [07-game_of_life](07-game_of_life)
  * [08-qemu_tock](08-qemu_tock)

## Getting Started

[Getting Started guide](doc/Getting_Started.md)

To install OpenOCD run the following commands:
<pre>
$ sudo apt-get update
$ sudo apt install automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev git
$ git clone https://github.com/raspberrypi/openocd.git --recursive --branch rp2040 --depth=1
$ cd openocd
$ ./bootstrap
$ ./configure --enable-ftdi --enable-sysfsgpio --enable-bcm2835gpio
$ make -j4
$ sudo make install
$ cd ~
</pre>

## Further Information


