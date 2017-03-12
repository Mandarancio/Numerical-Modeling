from utils import Image
import hopfieldnet as hn
import matplotlib.pyplot as plt
import sys
import json
import random as r
import numpy as np


def closest(images, reconstructed):
    me = hn.error(images[0], reconstructed)
    mi = 0
    for i in range(1, len(images)):
        e = hn.error(images[i], reconstructed)
        if e < me:
            me = e
            mi = i
    return mi, me


if len(sys.argv) < 2:
    print("Config file is needed. Ex: conf.json")
    sys.exit(0)

path = sys.argv[1]

with open(path) as data_file:
    config = json.load(data_file)

images = []
tlist = []

for ip in config['trainging_list']:
    i = Image(config['base_path']+ip)
    images.append(i)
    tlist.append(i.get_hnet_ready())

hnet = hn.HopfieldNetwork(config['vsize'])
hnet.train(tlist)

correct = 0
total = config['times']
errors = np.zeros(total)
avg_error = 0

for i in range(0, total):
    selected = r.randint(1, len(images))-1

    img = images[selected].get_copy()
    img.add_noise(config['noise'])

    hnet.set_state(img.get_hnet_ready())
    recovered, counter = hnet.loop(100)
    index, error = closest(tlist, recovered)
    errors[i] = error
    avg_error += error
    correct += 1 if index == selected else 0
print(str(correct)+'/'+str(total))
print('Avg error: '+str(avg_error/total))
plt.plot(errors)
plt.show()
