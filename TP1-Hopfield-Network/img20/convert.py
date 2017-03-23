import pygame

in_file = "bird.bmp"
out_file = "bird.txt"
f = open(out_file, "w")

img = pygame.image.load(in_file)

array = pygame.surfarray.array2d(img)

for y in range(array.shape[1]):
    for x in range(array.shape[0]):
        f.write(str(array[x, y]))

f.close()
