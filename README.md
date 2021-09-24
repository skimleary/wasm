<div align="center">
<h2>Rust, JavaScript, and WebAssembly</h2>
<p>
<a href="https://www.meetup.com/Charlottesville-Rust-Meetup/"><img src="doc/logo--Charlottesville_Rust_Meetup-blue.svg" width="179" height="20"></a>
<a href="doc/in_queue.md"><img src="doc/docs-lacking-red.svg" width="84" height="20"></a>
<img src="doc/demos-working-green.svg" width="100" height="20">
<img src="doc/contributions-welcome-brightgreen.svg" width="140" heigt="20">
</p>
</div>

Since its first appearance in the Firefox browser in November 2017, WebAssembly has gained momentum in its use for performant, efficient processing in client Web browsers, as well as in system-level use for other applications not normally associated with Web-oriented operation.

### Five Ws and How
### History

### Introduction

### Examples
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

### Getting Started

Refer to the [Getting Started guide](doc/Getting_Started.md) for more information.

To install `OpenOCD` run the following commands:

    $ sudo apt-get update
    $ sudo apt install automake autoconf build-essential texinfo libtool libftdi-dev libusb-1.0-0-dev git
    $ git clone https://github.com/raspberrypi/openocd.git --recursive --branch rp2040 --depth=1
    $ cd openocd
    $ ./bootstrap
    $ ./configure --enable-ftdi --enable-sysfsgpio --enable-bcm2835gpio
    $ make -j4
    $ sudo make install
    $ cd ~

### Further Reading

The following links provide related information to the Rust language, tooling, testing, and further use.

[Rust and WebAssembly](https://rustwasm.github.io/) and [Rust and WebAssembly](https://github.com/rustwasm)

[wasm-bindgen](https://rustwasm.github.io/wasm-bindgen/)

[Wasmer](https://github.com/wasmerio/wasmer)

[Implementing Conway's Game of Life](https://rustwasm.github.io/docs/book/game-of-life/implementing.html#rust-implementation)

[WebAssembly Studio](https://webassembly.studio/)

[Tock OS](https://github.com/tock/tock)

[Raspberry Pi Pico](https://github.com/tock/tock/blob/master/boards/raspberry_pi_pico/README.md)

[The Embedded Rust Book](https://docs.rust-embedded.org/book/index.html)

[WebAssembly Concepts](https://developer.mozilla.org/en-US/docs/WebAssembly/Concepts)

[Wasm Use Cases](https://webassembly.org/docs/use-cases/)

<br></br>

<div align="center"><sub>
<a href="doc/prod_notes.md">Production Notes</a><span> | </span>
<a href="doc/in_queue.md">In Queue</a><span> | </span>
<a href="doc/other.md">Other</a>
</sub></div>

