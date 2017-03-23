import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
from mpl_toolkits.mplot3d import Axes3D


def euler(f, y0, dh, t_end):
    N = int(round(t_end/dh))
    vals = np.zeros([N, 3])
    vals[0, :] = y0
    for i in range(1, N):
        vals[i, :] = vals[i-1, :]+dh*f(vals[i-1, :])
    return vals


def trapez(f, y0, dh, t_end):
    N = int(round(t_end/dh))
    vals = np.zeros([N, 3])
    vals[0, :] = y0
    old = f(y0)
    for i in range(1, N):
        new = f(vals[i-1, :])
        vals[i, :] = vals[i-1, :]+dh/2*(old+new)
        old = new
    return vals


def fixpoint(f, y0, dh, t_end, eps=1e-1):
    N = int(round(t_end/dh))
    vals = np.zeros([N, 3])
    vals[0, :] = y0
    old = f(y0)
    for i in range(1, N):
        new = f(vals[i-1, :])
        v1 = vals[i-1, :]+dh/2*(old+new)
        v2 = v1
        old = new
        for j in range(0, 100):
            new = f(v1)
            v2 = v1 + dh/2*(v1+new)
            if np.linalg.norm(v2-v1) <= eps:
                break
            v1 = v2
            old = new
        vals[i, :] = v2
    return vals


def lorenz(y):
    return np.array([10*(y[1]-y[0]), y[0]*(28-y[2])-y[1], y[0]*y[1]-8/3*y[2]])


h = 0.01
t_max = 4
y0 = np.array([-0.9101673912, -1.922121396, 18.18952097])

ye = euler(lorenz, y0, h, t_max)

yt = trapez(lorenz, y0, h, t_max)

# yf = fixpoint(lorenz, y0, h, t_max)

fig = plt.figure()
ax = fig.gca(projection='3d')
ax.plot(ye[:, 0], ye[:, 1], ye[:, 2], label='euler')
ax.plot(yt[:, 0], yt[:, 1], yt[:, 2], label='trapez')
# ax.plot(yf[:, 0], yf[:, 1], yf[:, 2], label='fixpoint')
plt.legend()

plt.show()
