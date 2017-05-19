#include "node.hxx"
#include <iostream>

#define NCHILD 4

int subdivide(double & v){
  v *= 2.0;
  int quadrant = 0;
  if (v < 1.0){
    quadrant = 0;
  }
  else{
    quadrant = 1;
    v -= 1.0;
  }
  return quadrant;
}


Node::Node(double mass, double x, double y):
  pos_(x,y), repos_(x,y), mass_(mass), side_length_(1.0)
{
  for (int i = 0;i<NCHILD; i++)
    child_.push_back(nullptr);

}

Node::Node(double mass, Vec2D pos):
mass_(mass), pos_(pos.x, pos.y),repos_(pos.x,pos.y), side_length_(1.0)
{
  for (int i = 0;i<NCHILD; i++)
    child_.push_back(nullptr);
}

double Node::side_length(){
  return side_length_;
}
void Node::side_length(double v){
  side_length_ = v;
}

Node* Node::child(int i){
  return child_.at(i);
}

void Node::child(int i, Node * n){
  child_[i] = n;
}

int Node::childs(){
  int counter = 0;
  for (auto b : child_){
    if (b!=nullptr){
      counter += b->childs();
    }
  }
  return counter;
}

Node * Node::copy(){
  Node * n = new Node(mass_, pos_.x, pos_.y);
  n->side_length(side_length_);
  n->momentum_ = this->momentum_;
  n->repos_ = this->repos_;
  return n;
}

bool Node::has_child(){
  for (int i=0;i<NCHILD;i++){
    if (child_[i]!= nullptr){
      return true;
    }
  }
  return false;
}

void Node::pos(Vec2D pos){
  pos_ = pos;
}

Vec2D Node::pos()
{
  return pos_;
}

double Node::mass(){
  return mass_;
}

void Node::mass(double v){
  mass_ = v;
}

Vec2D Node::momentum(){
  return momentum_;
}

void Node::momentum(Vec2D value)
{
  momentum_ = value;
}

Vec2D Node::force(Node node)
{
  Vec2D dist;
  dist = pos()-node.pos();
  double mod = dist.mod();
  if (mod<0.002){
    return Vec2D(0,0);
  }
  return dist*mass()/(mod*mod*mod);
}

int Node::into_next_quadrant(){
      side_length_ /=2;
      return subdivide(repos_.y) + 2 * subdivide(repos_.x);
}


void  Node::reset(){
      side_length_ = 1.0;
      // # Relative position inside the quadrant is equal to physical position.
      repos_ = Vec2D(pos_.x, pos_.y);
}
