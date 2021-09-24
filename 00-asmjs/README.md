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
The code samples provided are taken from existing sites. Here they are condensed as view, build, and run steps, so that discussion x x x.

Before any sample code that follows can execute, the Emscripten build tool must be installed.  Installation instructions can be found [here](foo/bar).
### Hello World
__Obligatory first build__

<details>
<summary>File: hello.c</summary>

    #include <stdio.h>  
    
    int main() {  
        printf("hello, world!\n");  
        return 0;  
    }
</details>
Build: <code>emcc -s WASM=0 hello_world.c -o hello_world.html</code><br />
Execute<sup>2</sup>: <code>python -m http.server 8000</code> -or- <code>python2 -m SimpleHTTPServer 8000</code><br />
Browse to: <code>localhost:8000/hello_world.html</code><br />

In the emcc command above the -s option indicates that JavaScript (asm.js) is to be generated instead of Wasm. The -o option indicates that Web target files are to be generated (hello.html and hello.js). The asm.js code will be embedded in hello.js.

__Build 2: Hello World and Simple DirectMedia Layer (SDL)<sup>3</sup>__

<details>
<summary>File: hello_world_sdl.cpp</summary>

    // Copyright 2011 The Emscripten Authors.  All rights reserved.
    // Emscripten is available under two separate licenses, the MIT license and the
    // University of Illinois/NCSA Open Source License.  Both these licenses can be
    // found in the LICENSE file.
    
    #include <stdio.h>
    #include <SDL/SDL.h>
    
    #ifdef __EMSCRIPTEN__
    #include <emscripten.h>
    #endif
    
    extern "C" int main(int argc, char** argv) {
      printf("hello, world!\n");
    
      SDL_Init(SDL_INIT_VIDEO);
      SDL_Surface *screen = SDL_SetVideoMode(256, 256, 32, SDL_SWSURFACE);
    
    #ifdef TEST_SDL_LOCK_OPTS
      EM_ASM("SDL.defaults.copyOnLock = false; SDL.defaults.discardOnLock = true; SDL.defaults.opaqueFrontBuffer = false;");
    #endif
    
      if (SDL_MUSTLOCK(screen)) SDL_LockSurface(screen);
      for (int i = 0; i < 256; i++) {
        for (int j = 0; j < 256; j++) {
    #ifdef TEST_SDL_LOCK_OPTS
          // Alpha behaves like in the browser, so write proper opaque pixels.
          int alpha = 255;
    #else
          // To emulate native behavior with blitting to screen, alpha component is ignored. Test that it is so by outputting
          // data (and testing that it does get discarded)
          int alpha = (i+j) % 255;
    #endif
          *((Uint32*)screen->pixels + i * 256 + j) = SDL_MapRGBA(screen->format, i, j, 255-i, alpha);
        }
      }
      if (SDL_MUSTLOCK(screen)) SDL_UnlockSurface(screen);
      SDL_Flip(screen); 
    
      printf("you should see a smoothly-colored square - no sharp lines but the square borders!\n");
      printf("and here is some text that should be HTML-friendly: amp: |&| double-quote: |\"| quote: |'| less-than, greater-than, html-like tags: |<cheez></cheez>|\nanother line.\n");
    
      SDL_Quit();
    
      return 0;
    }
</details>
Build: <code>emcc -s WASM=0 hello_world_sdl.c -o hello_world_sdl.html</code><br />
Execute: <code>python -m http.server 8000</code> -or- <code>python2 -m SimpleHTTPServer 8000</code><br />
Browse to: <code>localhost:8000/hello_world_sdl.html</code><br />

The above samples came from the Emscripten Tutorial<sup>4</sup>.  More information can be found there.


### Sweeper
Browser frames-per-second sweep test

## Further Reading
1: Originally seen as a Far Side comic  
2: [Big list of http static server one-liners](https://gist.github.com/willurd/5720255)  
3: [About SDL](https://www.libsdl.org/)  
4: [Emscripten Tutorial](https://emscripten.org/docs/getting_started/Tutorial.html)

- [asm.js site](http://asmjs.org)
- [asm.js](https://developer.mozilla.org/en-US/docs/Games/Tools/asm.js)
- [The Top 42 Asmjs Open Source Projects on Github](https://awesomeopensource.com/projects/asmjs)  
    This page has many Rust examples including Mandelbrot.

