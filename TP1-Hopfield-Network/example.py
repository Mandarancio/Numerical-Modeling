# Import the library
from utils import Image

# Create a new image
img = Image()

# Read the binary image bird.gif
img.read_image("img20/bird.gif")

# Print the image dimension
print(img.dim)

# Create a copy of img
img2 = img.get_copy()

# Print the (5,5) pixels of the image (either -1 or 1)
print(img.values[5,5])

# Add 10% noise to the image
img.add_noise(0.1)

# Write the image into img_bruit.gif
img.write_image("img_bruit.gif")
