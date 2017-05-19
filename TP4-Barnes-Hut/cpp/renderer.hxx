#ifndef RENDERER_HXX
#define RENDERER_HXX

#include <SDL2/SDL.h>
#include <SDL2/SDL_ttf.h>
#include <string>
#include "universe.hxx"

class Renderer{
public:
  Renderer(std::string title, int width, int height);
  bool initialized();
  bool display(Universe u, Vec2D center, double scale);
  void close();
private:
  void draw_frame();
  int w_, h_;
  bool ok_;
  int frame;
  SDL_Window * window;
  SDL_Renderer * renderer;
  TTF_Font * font;
  SDL_Surface* surfaceMessage;
  SDL_Texture* message;
  SDL_Rect message_rect; //create a rect
  SDL_Event e;
};

#endif
