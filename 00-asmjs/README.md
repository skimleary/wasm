<div align="center">
<img src="doc/asmjs.png" width="138" height="45">
</div>

* [History](#history)
* [Code Generation](#code-generation)
* [Code Samples](#code-samples)
  * [Hello World](#hello-world)
  * [Sweeper](#sweeper)
* [Further Reading](#further-reading)

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
The code samples provided are taken from existing sites. Here they are condensed as view, build, and run steps,
so that cursory discussions may follow.

Before any sample code that follows can execute, the Emscripten build tool must be installed.  Installation
instructions can be found [here](https://emscripten.org/docs/getting_started/downloads.html).

### Hello World

__Build 1: Obligatory Hello World__

<p><details>
<summary>File: hello_world.c</summary>

    /*
     * Copyright 2011 The Emscripten Authors.  All rights reserved.
     * Emscripten is available under two separate licenses, the MIT license and the
     * University of Illinois/NCSA Open Source License.  Both these licenses can be
     * found in the LICENSE file.
     */

    #include <stdio.h>  
    
    int main() {  
        printf("hello, world!\n");  
        return 0;  
    }

</details></p>

1. Build: `emcc -s WASM=0 hello_world.c -o hello_world.html`  
2. Execute<sup>2</sup>: `python3 -m http.server` -or- `python2 -m SimpleHTTPServer`  
3. Browse: `localhost:8000/hello_world.html`

In the emcc command above the -s option indicates that JavaScript (asm.js) is to be generated instead of Wasm (the default). The -o option indicates that Web target files are to be generated (hello_world.html and hello_world.js). The asm.js code will be embedded in hello_world.js.

__Build 2: Hello World and Simple DirectMedia Layer (SDL)<sup>3</sup>__

 Here a graphical element is added using the SDL library, taking advantage of Direct3D and OpenGL.
 
<p><details>
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
</details></p>

1. Build: `emcc -s WASM=0 hello_world_sdl.cpp -o hello_world_sdl.html`  
2. Execute: `python3 -m http.server` -or- `python2 -m SimpleHTTPServer`  
3. Browse: `localhost:8000/hello_world_sdl.html`

The above samples came from the Emscripten Tutorial<sup>4</sup>.  More information can be found [here](https://emscripten.org/docs/getting_started/Tutorial.html).


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
 
 
- [SDL Repo](https://github.com/libsdl-org/SDL)

