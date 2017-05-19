#ifndef VEC2D_HXX
#define VEC2D_HXX
#include <ostream>

class Vec2D{
public:
  Vec2D(double x=0, double y=0);

  static Vec2D rand();
  static Vec2D randn();

  double x;
  double y;

  double mod();

  Vec2D operator+(const Vec2D &b) const;
  Vec2D operator-(const Vec2D &b) const;
  Vec2D operator+(const double &b) const;
  Vec2D operator-(const double &b) const;
  Vec2D operator*(const double &b) const;
  Vec2D operator/(const double &b) const;
  Vec2D &operator=(const Vec2D &b);
};
std::ostream& operator<< (std::ostream& stream, const Vec2D& n);
Vec2D operator+(const double&a, const Vec2D &b);
Vec2D operator-(const double&a, const Vec2D &b);
Vec2D operator*(const double&a, const Vec2D &b);
double randd();

#endif
