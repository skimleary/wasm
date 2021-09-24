<div align="center">
<img src="doc/asmjs.png" width="138" height="45">
</div>

## History
* Browser wars
* Mozilla
* Reception

<img src="doc/miracle.png" width="372" height="136" align="top"><sup>1</sup>

## Code Generation
* return (num | 0) -> Return integer instead of default double
* x
* xx

## Code Samples
The code samples provided are taken from existing sites. Here they are condensed as edit, build, and run steps, so that discussion x x x.

Before any sample code that follows can execute, the Emscripten build tool must be installed.  Installation instructions can be found [here](foo/bar).
### Hello World
Obligatory first build

Edit: hello.c

    #include <stdio.h>  
    
    int main() {  
        printf("hello, world!\n");  
        return 0;  
    }

Build: <code>emcc -s WASM=0 hello.c -o index.html</code>  
Execute<sup>2</sup>: <code>python -m http.server 8000</code> -or- <code>python2 -m SimpleHTTPServer 8000</code>  
Browse to: <code>localhost:8000/index.html</code>

In the emcc command above the -s option indicates that JavaScript (asm.js) is to be generated instead of Wasm. The -o option indicates that Web target files are to be generated (index.html and index.js). The asm.js code will be embedded in index.js.


### Sweeper
Browser frames-per-second sweep test

## Further Reading
1: Originally seen as a Far Side comic.  
2: [Big list of http static server one-liners](https://gist.github.com/willurd/5720255)

- [asm.js site](http://asmjs.org)
- [asm.js](https://developer.mozilla.org/en-US/docs/Games/Tools/asm.js)
- [The Top 42 Asmjs Open Source Projects on Github](https://awesomeopensource.com/projects/asmjs)  
    This page has many Rust examples including Mandelbrot.

