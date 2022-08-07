import time
from multiprocessing import Pool
import multiprocessing
import logging


logger = multiprocessing.log_to_stderr()
logger.setLevel(logging.DEBUG)


def f(i):
    print(i + 1)


if __name__ == '__main__':
    with Pool(processes=3, maxtasksperchild=1) as pool:
        pool.starmap(
            f,
            [(i,) for i in range(10)]
        )
        logger.debug("sleep\n")
        # time.sleep(10)  # add this line to terminate Pool
