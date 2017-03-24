from utils import Image
import hopfieldnet as hn
import matplotlib.patches as mpatches
import matplotlib.pyplot as plt
import sys
import json
import random as r
import numpy as np


def closest(images, reconstructed, errorf=hn.error):
    me = errorf(images[0], reconstructed)
    mi = 0
    for i in range(1, len(images)):
        e = errorf(images[i], reconstructed)
        if e <= me:
            me = e
            mi = i
    return mi, me


def run_experience(hnet, error_f, noise, images, tlist, total):
    errors = np.zeros(total)
    avg_error = 0
    correct = 0

    for i in range(0, total):
        selected = r.randint(1, len(images))-1
        img = images[selected].get_copy()
        img.add_noise(noise)
        hnet.set_state(img.get_hnet_ready())
        recovered, counter = hnet.loop(100)
        index, _ = closest(tlist, recovered, errorf=error_f)
        error = error_f(images[selected].get_hnet_ready(),
                        recovered)
        errors[i] = error
        avg_error += error
        correct += 1 if index == selected else 0
    avg_error /= total
    std = np.std(errors)
    unidentified = 1.0 - float(correct)/total
    return avg_error, std, unidentified


def plot_results(xs, mean_error, std_error, unidentified, xlabel, title):
    plt.figure()
    plt.plot(xs, mean_error, 'r', label="error average")
    plt.plot(xs, std_error, 'b', label="STD")
    plt.plot(xs, unidentified, 'y', label="Classified")
    plt.xlabel(xlabel)
    plt.ylabel("error and STD")
    plt.title(title)
    red_patch = mpatches.Patch(color='red', label='Error average')
    blue_patch = mpatches.Patch(color='blue', label='Error STD')
    yellow_patch = mpatches.Patch(color='yellow',
                                  label='Unidentified')
    plt.legend(handles=[red_patch, blue_patch, yellow_patch], loc=2)
    plt.xlim([np.min(xs), np.max(xs)])


if __name__ == '__main__':

    if len(sys.argv) < 2:
        print("Config file is needed. Ex: conf.json")
        sys.exit(0)

    path = sys.argv[1]

    with open(path) as data_file:
        mconfig = json.load(data_file)

    if mconfig['mode'] == 'noise':
        for config in mconfig['experiences']:
            print('\n=== EXPERIENCE: "{}" ==='.format(config['name']))
            images = []
            tlist = []

            for ip in config['trainging_list']:
                i = Image(config['base_path']+ip)
                images.append(i)
                tlist.append(i.get_hnet_ready())

            hnet = hn.HopfieldNetwork(config['vsize'],
                                      qmatrix=config['qmatrix'])
            hnet.train(tlist)

            total = config['times']
            noise_cfg = config['noise']
            noise_x = np.linspace(start=noise_cfg['min'],
                                  stop=noise_cfg['max'],
                                  num=noise_cfg['steps'])
            error_ev = np.zeros(noise_cfg['steps'])
            error_var = np.zeros(noise_cfg['steps'])
            corr_class = np.zeros(noise_cfg['steps'])
            count = 0
            error_f = hn.ierror if config['error_method'] == 'inverse'\
                else hn.error
            for noise in noise_x:
                avg_error, std, unidentified = run_experience(hnet, error_f,
                                                              noise, images,
                                                              tlist, total)
                print('\n---'+str(noise)+'---')
                print('UnClassified: {}%'.format(round(unidentified*100)))
                print('Avg error: {}'.format(avg_error))
                print('Std error: {}'.format(std))
                error_ev[count] = avg_error
                error_var[count] = std
                corr_class[count] = unidentified
                count += 1
            plot_results(noise_x, error_ev, error_var, corr_class,
                         "noise intensity", config['name'])
            plt.savefig(mconfig['output'] +
                        str(len(config['trainging_list']))
                        + '_' + config['error_method']+'.png')

    elif mconfig['mode'] == 'nimages':
        for config in mconfig['experiences']:
            print('\n=== EXPERIENCE: "{}" ==='.format(config['name']))
            n_tot_imgs = len(config['trainging_list'])
            error_ev = np.zeros(n_tot_imgs-1)
            error_var = np.zeros(n_tot_imgs-1)
            corr_class = np.zeros(n_tot_imgs-1)
            x_imgs = np.linspace(2, n_tot_imgs, num=n_tot_imgs-1)
            for n_imgs in range(1, n_tot_imgs):

                images = []
                tlist = []

                for i in range(0, n_imgs):
                    ip = config['trainging_list'][i]
                    i = Image(config['base_path']+ip)
                    images.append(i)
                    tlist.append(i.get_hnet_ready())

                hnet = hn.HopfieldNetwork(config['vsize'],
                                          qmatrix=config['qmatrix'])
                hnet.train(tlist)
                plt.figure()
                plt.imshow(hnet.weigths())
                plt.savefig(mconfig['output'] + config['name'] + '-w' +
                            str(n_imgs) + '.png')
                plt.close()

                total = config['times']
                noise = config['noise']
                error_f = hn.ierror if config['error_method'] == 'inverse'\
                    else hn.error

                avg_error, std, unidentified = run_experience(hnet, error_f,
                                                              noise, images,
                                                              tlist, total)
                print('\n--- {} ---'.format(n_imgs+1))
                print('UnClassified: {}%'.format(round(unidentified*100)))
                print('Avg error: {}'.format(avg_error))
                print('Std error: {}'.format(std))
                error_ev[n_imgs-1] = avg_error
                error_var[n_imgs-1] = std
                corr_class[n_imgs-1] = unidentified

            plot_results(x_imgs, error_ev, error_var, corr_class,
                         "N images", config['name'])
            plt.savefig(mconfig['output']+config['name'] + '_' +
                        str(config['noise'])
                        + '_' + str(n_imgs) + '.png')
    elif mconfig['mode'] == 'test':
        for config in mconfig['experiences']:
            print('\n=== EXPERIENCE: "{}" ==='.format(config['name']))
            images = []
            tlist = []

            for ip in config['trainging_list']:
                i = Image(config['base_path']+ip)
                images.append(i)
                tlist.append(i.get_hnet_ready())

            hnet = hn.HopfieldNetwork(config['vsize'],
                                      qmatrix=config['qmatrix'])
            hnet.train(tlist)

            noise = config['noise']
            error_f = hn.ierror if config['error_method'] == 'inverse'\
                else hn.error
            selected = Image(config['base_path']+config['selected'])

            img = selected.get_copy()
            img.add_noise(noise)
            hnet.set_state(img.get_hnet_ready())
            plt.figure()
            plt.imshow(selected.values.T)
            plt.savefig(mconfig['output']+config['name']+'_selected.png')
            plt.figure()
            plt.imshow(img.values.T)
            plt.savefig(mconfig['output']+config['name']+'_noisy.png')
            recovered, counter = hnet.loop(100)
            plt.figure()
            plt.imshow(recovered.reshape(config['isize']).T)
            plt.savefig(mconfig['output']+config['name']+'_reconstructed.png')
            print("converged after {} iterations".format(counter))

    plt.show()
