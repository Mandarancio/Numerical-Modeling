#include "universe.hxx"
#include <iostream>
#include <algorithm>

#define  smallest_quadrant 1.e-4

Node* add(Node * body, Node * node);
void clean(Node * , std::vector<Node*>);
Vec2D force_on(Node * body, Node *  node, double theta=0.5);

Universe::Universe(double G, bool brute_force): G_{G}, scale_(100), brute_force_(brute_force)
{
}

double Universe::G(){
  return G_;
}

double Universe::scale(){
  Vec2D center = this->center();
  double scale_ = 0;
  for (auto bi : nodes_){
    Vec2D dist = center-bi->pos();
    if (dist.mod()>scale_){
      scale_ = dist.mod();
    }
  }
  return scale_;
}

Vec2D Universe::center(){
  center_ = Vec2D(0,0);
  for (auto bi : nodes_){
    center_ = center_+bi->pos();
  }
  center_ = center_/nodes_.size();
  return center_;
}

std::vector<Node*> Universe::nodes(){
  return nodes_;
}

void Universe::add_node(Node* n){
  nodes_.push_back(n);
}



void Universe::simulate(double dt){
  if (brute_force_){
    _sim_brute_force(dt);
  }else{
    _sim_barnes_hut(dt);
  }
}

void Universe::_sim_brute_force(double dt){
  Vec2D ipos;
  Vec2D mom;
  for (auto bi : nodes_){
    ipos = bi->pos();
    mom = bi->momentum();
    for (auto bj : nodes_){
      auto force = bj->force(*bi);
      mom = mom + G_*force*dt;
    }
    bi->momentum(mom);
    ipos = ipos+mom*dt;
    bi->pos(ipos);
  }
}

void Universe::_sim_barnes_hut(double dt){
  Node * root;
  for (auto bi: nodes_){
    add(bi, root);
  }

  Vec2D ipos;
  Vec2D mom;
  for (auto bi : nodes_){
    ipos = bi->pos();
    mom = bi->momentum();
    auto force = force_on(bi, root);
    mom = mom +G_*force*dt;
    bi->momentum(mom);
    ipos = ipos+mom*dt;
    bi->pos(ipos);
  }
  clean(root, nodes_);
}

Node* add(Node * body, Node *node){
      Node * new_node = node == nullptr ?  body : nullptr;
      if (node != nullptr and node->side_length() > smallest_quadrant){
        if (!node->has_child()) {
            new_node = node->copy();
            int quadrant = node->into_next_quadrant();
            new_node->child(quadrant,node);
        }
        else{
            new_node = node;
        }
        Vec2D pos;
        // # 2. and 3. If node n is or has become an internal node ...
        // #           ... update its mass and "center-of-mass times mass".
        int n = new_node->childs()+1;
        double tot_mass = new_node->mass()+ body->mass();

        pos = (new_node->pos()*n + body->pos())/(n+1);
        new_node->pos(pos);
        new_node->mass(tot_mass);
        // # ... and recursively add the new body into the appropriate quadrant.
        int quadrant = body->into_next_quadrant();
        new_node->child(quadrant, add(body, new_node->child(quadrant)));
      }

      return new_node;
}

void clean(Node*  root, std::vector<Node *>bl){
  if (root == nullptr){
    return;
  }
  if (root->has_child()){
    for (int i =0;i<4;i++){
      auto child = root->child(i);
      clean(child, bl);
    }
  }
  if (std::find(bl.begin(), bl.end(), root) != bl.end()) {
    return ;
  } else {
    delete root;
  }
}

Vec2D force_on(Node * body, Node *  node, double theta){
    // # Barnes-Hut algorithm: usage of the quad-tree. This function computes
    // # the net force on a body exerted by all bodies in node "node".
    // # Note how the code is shorter and more expressive than the human-language
    // # description of the algorithm.
    // # 1. If the current node is an external node,
    // #    calculate the force exerted by the current node on b.
    if (!node->has_child())
        return node->force(*body);

    Vec2D dist;
    // std::cout<<node->pos()<<" "<<body->pos()<<"\n";
    dist = node->pos()-body->pos();
    if (node->side_length() < dist.mod()*theta){
      // std::cout<<"here\n";
      return node->force(*body);
    }
    Vec2D force;
    // # 3. Otherwise, run the procedure recursively on each child.
    for (int i =0;i<4;i++){
      auto child = node->child(i);
      if (child!= nullptr)
        force = force + force_on(body, child, theta);
    }
    // std::cout<<force<<"\n";
    return force;
}
