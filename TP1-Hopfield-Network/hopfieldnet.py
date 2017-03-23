import numpy as np


def error(a, b):
    err = np.sum(np.abs(a-b))/(2*a.size)
    return err


def ierror(a, b):
    err = np.sum(np.abs(a-b))/(2*a.size)
    ierr = np.sum(np.abs(a+b))/(2*a.size)
    return err if err < ierr else ierr
    # return err


class HopfieldNetwork:
    def __init__(self, count=400, qmatrix=True):
        self.__state__ = np.ones([1, count])
        self.__weigths__ = np.zeros([count, count])
        self.__count__ = count
        self.__qmatrix__ = qmatrix

    def weigths(self):
        return self.__weigths__

    def set_state(self, state):
        self.__state__ = state

    def train(self, training_list):
        self.__weigths__ = np.zeros([self.__count__, self.__count__])
        v = np.zeros([len(training_list), training_list[0].size])
        for i in range(0, len(training_list)):
            v[i, :] = training_list[i][:]
        if self.__qmatrix__:
            self.__weigths__ = v.T.dot(np.linalg.inv(v.dot(v.T))).dot(v)
        else:
            self.__weigths__ = v.T.dot(v)

    def __F__(self, h):
        return np.sign(h)

    def __h__(self, s):
        return s.dot(self.__weigths__)

    def iterate(self):
        self.__state__ = self.__F__(self.__h__(self.__state__))
        return self.__state__

    def state(self):
        return self.__state__

    def loop(self, max=100):
        old_state = self.__state__.copy()
        converged = 0
        counter = 0
        while counter < max and converged < 5:
            self.iterate()
            counter += 1
            e = error(old_state, self.__state__)
            converged = converged+1 if (e == 0.0) else 0
            old_state = self.__state__.copy()

        return self.__state__, counter
