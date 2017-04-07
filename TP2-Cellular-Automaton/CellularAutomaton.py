import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation


def load_config(path, version='lif'):
    matrix = []
    with open(path) as f:
        if version == 'lif':
            for l in f.readlines():
                p = l.replace('\n', '')
                if not p.startswith('#'):
                    for i in range(0, len(p)):
                        line.append(1 if p[i] == '*' else 0)
                    matrix.append(line)
            return np.array(matrix)
        elif version == 'rle':
            y = 0
            x = 0
            init = False
            for l in f.readlines():
                p = l.replace('\n', '')
                if not p.startswith('#'):
                    if p.startswith('x'):
                        p = p.replace(' ', '')
                        p = p.split(',')
                        w = int(p[0].split('=')[1])
                        h = int(p[1].split('=')[1])
                        matrix = np.zeros([h, w], dtype=int)
                        init = True
                    elif init:
                        c = 1
                        t = ''
                        for i in range(0, len(p)):
                            if p[i] == 'o' or p[i] == 'b':
                                if len(t) > 0:
                                    c = int(t)
                                    t = ''
                                else:
                                    c = 1
                                matrix[y, x:x+c] = 1 if p[i] == 'o' else 0
                                x += c
                            elif p[i] == '$':
                                c = 1
                                if len(t) > 0:
                                    c = int(t)
                                y += c
                                x = 0
                                t = ''
                            elif p[i] == '!':
                                return matrix
                            else:
                                t += p[i]
        return matrix


def game_of_life_rules():
    rules = {}
    max_vals = (2**9)
    for i in range(0, max_vals):
        count = bin(i).count('1')
        if i % 2 == 0:
            '''centrall cell is dead'''
            rules[i] = 1 if count == 3 else 0
        else:
            rules[i] = 1 if (count == 3 or count == 4) else 0
    return rules


def parity_rules():
    rules = {}
    max_vals = (2**5)
    for i in range(0, max_vals):
        count = bin(i << 1).count('1')
        if count % 2 == 0:
            rules[i] = 0
        else:
            rules[i] = 1
    return rules


class CellularAutomaton:
    def __init__(self, rules, initial_state):
        self.__w__ = initial_state.shape[0]
        self.__h__ = initial_state.shape[1]
        self.__matrix__ = initial_state.copy()
        self.__rules__ = rules
        self.__t__ = 0

    def accumulate(self,  neighborhood='vonNeumann'):
        k = self.__matrix__.copy()
        k += np.roll(self.__matrix__, 1, axis=0) << 1
        k += np.roll(self.__matrix__, 1, axis=1) << 2
        k += np.roll(self.__matrix__, -1, axis=0) << 3
        k += np.roll(self.__matrix__, -1, axis=1) << 4

        if neighborhood != 'vonNeumann':
            k += np.roll(np.roll(self.__matrix__, 1, axis=0), 1, axis=1) << 5
            k += np.roll(np.roll(self.__matrix__, 1, axis=0), -1, axis=1) << 6
            k += np.roll(np.roll(self.__matrix__, -1, axis=0), 1, axis=1) << 7
            k += np.roll(np.roll(self.__matrix__, -1, axis=0), -1, axis=1) << 8
        return k

    def apply_rules(self, m):
        for rule in self.__rules__:
            m[m == rule] = self.__rules__[rule]
        return m

    def step(self, neighborhood='vonNeumann'):
        self.__matrix__ = self.apply_rules(self.accumulate(neighborhood))
        self.__t__ += 1
        return self.__matrix__

    def pprint(self):
        print('\niteration {}\n'.format(self.__t__))
        for y in range(0, self.__h__):
            s = ' '
            for x in range(0, self.__w__):
                s += '. ' if self.__matrix__[x, y] == 0 else '# '
            print(s)

    def state(self):
        return self.__matrix__

    def plot(self, save=False, auto_close=False, base_path=''):
        plt.figure()
        m = self.__matrix__.copy()
        plt.imshow(m, cmap=plt.get_cmap('Vega20c'))
        title = 'Iteration {}'.format(self.__t__)
        plt.title(title)
        if save:
            path = '{}it_{:04d}.png'.format(base_path, self.__t__)
            plt.savefig(path)
        if auto_close:
            plt.close()


if __name__ == '__main__':
    import sys
    import json
    argv = sys.argv
    if len(argv) < 2:
        print('  Usage: CellularAutomaton <CONFIG.JSON>')
        sys.exit(0)
    with open(argv[1]) as f:
        config = json.load(f)
    if config['mode'] == 'gameOfLife':
        rules = game_of_life_rules()
    else:
        rules = parity_rules()
    glconfig = load_config(config['config'], config['config_version'])
    ca = CellularAutomaton(rules, glconfig)
    if config['plotmode'] == 'animated':
        fig = plt.figure()
        im = plt.imshow(ca.state(), animated=True)

        def updatefig(*args):
            im.set_array(ca.step(neighborhood=config['mode']))
            return im,

        ani = animation.FuncAnimation(fig, updatefig, interval=30, blit=True)

        plt.show()
    else:
        ca.plot(save=True, auto_close=True, base_path=config['output_path'])
        for i in range(0, config['iterations']):
            ca.step(neighborhood=config['mode'])
            ca.plot(save=True, auto_close=True,
                    base_path=config['output_path'])
