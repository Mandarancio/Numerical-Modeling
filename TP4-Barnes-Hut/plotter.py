"""Plot performaces"""
import matplotlib.pyplot as plt

min_bh = []
avg_bh = []
max_bh = []
min_bf = []
avg_bf = []
max_bf = []

with open('barneshut_perf.csv') as f:
    lines = f.readlines()[1:]
    for l in lines:
        l = l.split(',')
        min_bh.append(l[1])
        avg_bh.append(l[2])
        max_bh.append(l[3])
with open('bruteforce_perf.csv') as f:
    lines = f.readlines()[1:]
    for l in lines:
        l = l.strip().split(',')
        min_bf.append(l[1])
        avg_bf.append(l[2])
        max_bf.append(l[3])

numbodies = [10, 50, 100, 200, 300, 400, 500, 1000]

plt.figure(dpi=300)
# plt.plot(numbodies, max_bh, 'C0:')
plt.plot(numbodies, avg_bh, label='Barnes-Hut', color='C0')
# plt.plot(numbodies, min_bh, 'C0:')
# plt.plot(numbodies, min_bf, 'C1:')
# plt.plot(numbodies, max_bf, 'C1:')
plt.plot(numbodies, avg_bf, label='Brute Force', color='C1')
plt.xlabel('number of bodies')
plt.ylabel('time (s)')
plt.grid(True)
plt.legend()

plt.figure(dpi=300)
# plt.plot(numbodies, max_bh, 'C0:')
plt.plot(numbodies[:-1], avg_bh[:-1], label='Barnes-Hut', color='C0')
# plt.plot(numbodies, min_bh, 'C0:')
# plt.plot(numbodies, min_bf, 'C1:')
# plt.plot(numbodies, max_bf, 'C1:')
plt.plot(numbodies[:-1], avg_bf[:-1], label='Brute Force', color='C1')
plt.xlabel('number of bodies')
plt.ylabel('time (s)')
plt.grid(True)
plt.legend()
plt.show()
