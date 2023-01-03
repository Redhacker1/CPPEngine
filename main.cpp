#include "SDL.h"
#include <random>
#include <iostream>
#include <chrono>
#include <SDL_syswm.h>


int main(int argc, char* args[])
{

    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window *window = SDL_CreateWindow(
            "SDL2Demo",
            SDL_WINDOWPOS_UNDEFINED,
            SDL_WINDOWPOS_UNDEFINED,
            1920,
            1080,
            0
    );

    SDL_SysWMinfo wmInfo;
    SDL_VERSION(&wmInfo.version);
    SDL_GetWindowWMInfo(window, &wmInfo);
    HWND hwnd = wmInfo.info.win.window;

    SDL_Event input;
    bool quit = false;

    while (!quit)
    {
        while(SDL_PollEvent(&input) > 0)
        {
            if(input.type == SDL_QUIT)
            {
                quit = true;
            }
            else if (input.type == SDL_KEYDOWN) {

            }
            else if (input.type == SDL_KEYUP)
            {
                if(input.key.repeat == 0)
                {

                }
            }


        }

    }


    SDL_DestroyWindow(window);
    SDL_Quit();;

    return 0;
}


