# Hopfield Network assignment

The goal of this first assignment is to create a simple Hopfield Network to reconstruct
simple 20x20 noisy images.

To run the script:
```
 python3 main.py CONFIG_FILE.json
 ```

 The configurations files used for the report are stored in the folder configs/

 the config file has this structure:
 ```json
{
  "mode": "MODE",
  "experiences":[
    ...
  ],
  "output" : "OUTPUT_FILE"
}
 ```
 possible modes are: ```test```, ```noise``` and ```nimages```.

## Test
In this mode the program will train an HN and will try to reconstruct the selected noisy image:
```json
{
 "mode": "test",
 "experiences":[
   {
     "name": "TITLE",
     "error_method": "[inverse/normal]",
     "base_path":"IMAGES_FOLDER/",
     "trainging_list":[
       "IMAGE_1",
       "IMAGE_2",
       "...."
     ],
     "selected" : "IMAGE_I",
     "noise": NOISE_LEVEL (0.0 -> 1.0),
     "vsize": VECTOR_IMAGE_SIZE (w*h),
     "isize": [IMAGE_WIDTH, IMAGE_HEIGHT],
     "qmatrix" : SUPPORT_MATRIX_FLAG (true/false)
   },
   ...
 ],
 "output" : "OUTPUT_FILE"
}
```
