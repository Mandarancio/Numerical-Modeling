#ifndef NODE_HXX
#define NODE_HXX

#include "vec2d.hxx"
#include <vector>

class Node{
public:
  Node(double mass, double x, double y);
  Node(double mass, Vec2D pos);

  Vec2D pos();
  void pos(Vec2D pos);
  double mass();
  void mass(double m);
  Vec2D force(Node node);
  Vec2D momentum();
  void momentum(Vec2D value);
  double side_length();
  void side_length(double v);
  Node*child(int i);
  void child(int i, Node * n);
  Node * copy();
  bool has_child();
  int into_next_quadrant();
  void reset();
  int childs();

private:
  double mass_;
  Vec2D momentum_;
  Vec2D pos_;
  Vec2D repos_;
  double side_length_;
  std::vector<Node*> child_;
};

#endif
