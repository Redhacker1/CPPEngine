#include "SDL.h"
#include <random>
#include <iostream>
#include <chrono>
#include <SDL_opengl.h>
#include "GL/gl.h"


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

    SDL_Renderer* renderer = SDL_CreateRenderer(window, 0, SDL_RENDERER_SOFTWARE);

    SDL_Event input;
    int r = 0, g = 255, b = 0;
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
                if (input.key.repeat == 0) {
                    std::cout << SDL_GetScancodeName(input.key.keysym.scancode) << std::endl;
                }
                //...randomize the renderer's draw color
                r = std::rand() % 255;
                g = std::rand() % 255;
                b = std::rand() % 255;
            }
            else if (input.type == SDL_KEYUP)
            {
                if(input.key.repeat == 0)
                {
                    std::cout << SDL_GetScancodeName(input.key.keysym.scancode) << " is up"<< std::endl;
                }
            }

            SDL_SetRenderDrawColor(renderer, r, g, b, 255);

            SDL_DisplayMode displayMode;
            SDL_GetWindowDisplayMode(window, &displayMode);

            SDL_Rect Rect = SDL_Rect();
            Rect.w = displayMode.w;
            Rect.h = displayMode.h;

            SDL_RenderDrawRect(renderer,&Rect);

        }
        SDL_RenderClear(renderer);
        SDL_RenderPresent(renderer);
    }


    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();;

    return 0;
}
