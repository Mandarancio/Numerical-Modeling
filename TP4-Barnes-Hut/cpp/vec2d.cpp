#include "vec2d.hxx"
#include <cmath>
#include <cstdlib>
#define PI 3.14159265359

double randd(){
  return double(rand())/RAND_MAX;
}

Vec2D::Vec2D(double x, double y){
  this->x = x;
  this->y = y;
}

Vec2D Vec2D::rand(){
  double x = randd();
  double y = randd();
  return Vec2D(x,y);
}

Vec2D Vec2D::randn(){
  double u0 = randd();
  double u1 = randd();
  double x = sqrt(-2*log(u0))*cos(2*PI*u1);
  double y = sqrt(-2*log(u0))*sin(2*PI*u1);
  return Vec2D(x,y);
}


double Vec2D::mod(){
  return sqrt(x*x+y*y);
}

Vec2D Vec2D::operator+(const Vec2D &b) const{
  return Vec2D(this->x+b.x,this->y+b.y);
}

Vec2D Vec2D::operator-(const Vec2D &b) const{
  return Vec2D(this->x-b.x,this->y-b.y);
}

Vec2D Vec2D::operator+(const double &b) const{
  return Vec2D(this->x+b,this->y+b);
}

Vec2D Vec2D::operator-(const double &b) const{
  return Vec2D(this->x-b,this->y-b);
}

Vec2D Vec2D::operator*(const double &b) const{
  return Vec2D(b*this->x,b*this->y);
}

Vec2D Vec2D::operator/(const double &b) const{
  return Vec2D(this->x/b,this->y/b);
}
Vec2D & Vec2D::operator=(const Vec2D &b){
  this->x=b.x;
  this->y=b.y;
  return *this;
}

Vec2D operator+(const double&a, const Vec2D &b){
  return Vec2D(a+b.x, a+b.y);
}

Vec2D operator-(const double&a, const Vec2D &b){
  return Vec2D(a-b.x, a-b.y);
}

Vec2D operator*(const double&a, const Vec2D &b){
  return Vec2D(a*b.x, a*b.y);
}


std::ostream& operator<< (std::ostream& stream, const Vec2D& n){
  stream <<"("<<n.x<<", "<<n.y<<")";
  return stream;
}
