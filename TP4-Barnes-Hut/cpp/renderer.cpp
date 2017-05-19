#include "renderer.hxx"
#include <iostream>
#include <SDL2/SDL2_gfxPrimitives.h>

Renderer::Renderer(std::string title, int width, int height):
w_(width), h_(height), ok_(false), frame(0)
{
  if (SDL_Init(SDL_INIT_VIDEO) != 0){
    std::cout << "SDL_Init Error: " << SDL_GetError() << std::endl;
    return;
  }
  window = SDL_CreateWindow(title.c_str(), 100, 100, width, height, SDL_WINDOW_SHOWN);
  if (window == nullptr){
    std::cout << "SDL_CreateWindow Error: " << SDL_GetError() << std::endl;
    SDL_Quit();
    return;
  }
  renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
  if (renderer == nullptr){
  	SDL_DestroyWindow(window);
  	std::cout << "SDL_CreateRenderer Error: " << SDL_GetError() << std::endl;
  	SDL_Quit();
  	return;
  }
  TTF_Init();
  font = TTF_OpenFont("source.ttf",24);

  message_rect.x = 5;  //controls the rect's x coordinate
  message_rect.y = 5; // controls the rect's y coordinte
  message_rect.w = 100; // controls the width of the rect
  message_rect.h = 100; // controls the height of the rect
	ok_ = true;
}


bool Renderer::initialized(){
  return ok_;
}

bool Renderer::display(Universe u, Vec2D center, double scale){
  while (SDL_PollEvent(&e)){
    if (e.type == SDL_QUIT){
      return true;
    }
  }
  SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
  SDL_RenderClear(renderer);
  for (auto n: u.nodes()){
    Vec2D v = (n->pos()-center)*scale;
    int x = round(v.x + w_/2);
    int y = round(v.y + h_/2);
    filledCircleRGBA(renderer,x, y, 2,255,255,200,255);
    circleRGBA(renderer, x, y, 2, 255, 255, 200, 255);
  }

  this->draw_frame();
  SDL_RenderPresent(renderer);

  frame ++;
  return false;
}

void Renderer::draw_frame(){
  SDL_Color textColor = { 255, 255, 255, 255 };
  SDL_FreeSurface(surfaceMessage);
  surfaceMessage = TTF_RenderText_Blended(font, std::to_string(frame).c_str(), textColor);
  TTF_SizeText(font, std::to_string(frame).c_str(), &message_rect.w, &message_rect.h);
  message = SDL_CreateTextureFromSurface(renderer, surfaceMessage);
  SDL_RenderCopy(renderer, message, NULL, &message_rect);
}

void Renderer::close(){
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  TTF_Quit();
  SDL_Quit();
}
