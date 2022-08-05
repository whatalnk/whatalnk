import time
from multiprocessing import Pool


def f(i):
    print(i + 1)


if __name__ == '__main__':
    with Pool(processes=3, maxtasksperchild=1) as pool:
        pool.starmap(
            f,
            [(i,) for i in range(10)]
        )
        # time.sleep(1)  # add this line to terminate Pool
