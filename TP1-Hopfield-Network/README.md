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
 
