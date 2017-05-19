#include <iostream>
#include "node.hxx"
#include "universe.hxx"
#include "renderer.hxx"

#define AUTOCENTER true
#define AUTOSCALE false
#define SOLARSYSTEM false

const int SCREEN_WIDTH  = 800;
const int SCREEN_HEIGHT = 600;
const double G = 4e-6;
const double DT = 1e-3;
const double INI_RADIUS = 0.1;
const double INI_SPEED = 0.1;
const double MASS = 1.0;
const int N_BODIES = 200;




double orbit_speed(double G, double mass, double r)
{
  double mu = G*mass;
  double eps = -mu/(2*r);
  double sp = sqrt(2*(mu/r+eps));
  return sp;
}


Vec2D init_momentum(Vec2D pos, double inivel, double radius,double mass){
	double norm = pos.mod();
	return Vec2D(-pos.y, pos.x) * mass * inivel * norm / radius;
}

#if SOLARSYSTEM
void init_nodes(Universe & u,Vec2D center, double radius ,double mass, double inivel, int N){
	Node * sun = new Node(100.0, Vec2D(0,0));
	u.add_node(sun);
	double r = 0.1;

	Node * pla = new Node(0.01, Vec2D(r,0));
	pla->momentum(Vec2D(0,-orbit_speed(u.G(), 100.0, r)));
	u.add_node(pla);
	r = 0.05;
	pla = new Node(0.1, Vec2D(r,0));
	pla->momentum(Vec2D(0,-orbit_speed(u.G(), 100.0, r)));
	u.add_node(pla);
	r = 0.02;
	pla = new Node(0.01, Vec2D(r,0));
	pla->momentum(Vec2D(0,-orbit_speed(u.G(), 100.0, r)));
	u.add_node(pla);
}
#else
void init_nodes(Universe & u,Vec2D center, double radius ,double mass, double inivel, int N){
  for (int i = 0; i < N; i++){
    double n_mass = mass;
    Vec2D pos= radius*Vec2D::randn();
    Node* node =new Node(n_mass,  pos+center);
		node->momentum(init_momentum(pos, inivel, radius, n_mass));
    u.add_node(node);
  }
}
#endif


int main(int argc, char* argv[]){
	double scale = 100;
	Vec2D center;
	Universe u(G);
  init_nodes(u, Vec2D(0,0), INI_RADIUS, MASS, INI_SPEED, N_BODIES);
	u.simulate(0);

  scale = SCREEN_HEIGHT/(4*u.scale());
	center = u.center();

	Renderer ren("Universe", SCREEN_WIDTH, SCREEN_HEIGHT);

	bool quit = false;
	while (!quit){

		u.simulate(DT);

		#if AUTOCENTER
		center = u.center();
		#endif
		#if AUTOSCALE
		scale = SCREEN_HEIGHT/(4*u.scale());
		#endif

	  quit = ren.display(u,center,scale);
	}
  ren.close();

  return 0;
}
