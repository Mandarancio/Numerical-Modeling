#ifndef UNIVERSE_HXX
#define UNIVERSE_HXX

#include "vec2d.hxx"
#include "node.hxx"
#include <vector>

class Universe
{
public:
  Universe(double G, bool brute_force=true);
  double G();
  std::vector<Node*> nodes();
  void add_node(Node* n);
  void simulate(double dt);
  double scale();
  Vec2D center();
private:
  void _sim_brute_force(double dt);
  void _sim_barnes_hut(double dt);
  double G_;
  bool brute_force_;
  double scale_;
  Vec2D center_;
  std::vector<Node*> nodes_;
};


#endif
