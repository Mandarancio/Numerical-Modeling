import os,sys
from PIL import Image as PIL_Image
import random
import numpy as np

# Class representing an image
class Image:
    # Initialize an instance of Image
    def __init__(self, filename=None):
        self.dim = None
        self.values = None
        if filename:
            self.read_image(filename)

    # Read an image
    def read_image(self, fileName):
        img = PIL_Image.open(fileName)
        self.dim = img.size
        self.values = np.zeros(self.dim)
        pixels = img.load()
        for i in range(self.dim[0]):
            for j in range(self.dim[1]):
                if pixels[(i,j)] == 0 :
                    self.values[i,j] = -1
                else :
                    self.values[i,j] = pixels[(i,j)]
        del pixels

    # Write an image
    def write_image(self, fileName):
        img = PIL_Image.new("1", self.dim)
        pixels = img.load()
        for i in range(self.dim[0]):
            for j in range(self.dim[1]):
                if self.values[i,j] == -1 :
                    pixels[(i,j)] = 0
                else :
                    pixels[(i,j)] = self.values[i,j]
        img.save(fileName)
        del pixels

    def add_noise(self, noiseThreshold):
        for i in range(self.dim[0]):
            for j in range(self.dim[1]):
                if random.random() <= noiseThreshold :
                    self.values[i,j] *= -1

    def get_copy(self):
        img = Image()
        img.dim = self.dim
        img.values = self.values.copy()
        return img
