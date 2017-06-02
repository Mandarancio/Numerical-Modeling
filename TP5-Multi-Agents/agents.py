"""Multi-Agent model.

author: Martino Ferrari
"""
import numpy as np
import numpy.random as rnd
import matplotlib.pyplot as plt


def __randir__():
    di = rnd.rand(2)
    return di/np.linalg.norm(di)


class Agent:
    """Bacterial agent."""
    def __init__(self, pos):
        self.pos = pos
        self.speed = 20
        self.direction = __randir__()
        self.density = 0

    def move(self, dt):
        """Move bacteria."""
        self.pos += self.speed * dt * self.direction

    def update(self, density):
        """Update direction."""
        p = 0.9 if density > self.density else 0.5
        self.density = density
        if rnd.rand() > p:
            self.direction = __randir__()

def __density__(pos, center):
    return 1.0/(1+np.linalg.norm(pos-center))

def __init_bacteria__(N, size):
    posx = rnd.rand(N)*size/2-size/2
    posy = rnd.rand(N)*size/2-size/2
    return [Agent(np.array([px, py])) for (px, py) in zip(posx, posy)]


def __plot__(agents):
    xs = np.zeros(len(agents))
    ys = np.zeros(len(agents))
    for i in range(0, len(agents)):
        xs[i] = agents[i].pos[0]
        ys[i] = agents[i].pos[1]
    plt.scatter(xs, ys)


if __name__ == "__main__":
    __NBACT__ = 100
    __ITER__ = 1
    __SIZE__ = 10
    __DT__ = 0.2
    __CENTER__ = np.array([0, 0])
    N = 100
    DS = __SIZE__*2/N
    FOOD = np.zeros([N, N])
    for i in range(N):
        x = i*DS-__SIZE__
        for j in range(N):
            y = j*DS-__SIZE__
            FOOD[i, j] = __density__([x, y], __CENTER__)
    plt.figure(0)
    plt.imshow(FOOD)
    AGENTS = __init_bacteria__(__NBACT__, __SIZE__)
    for _ in range(0, __ITER__):
        for ag in AGENTS:
            ag.move(__DT__)
            ag.update(__density__(ag.pos, __CENTER__))
        plt.figure(1)
        __plot__(AGENTS)
    plt.show()
