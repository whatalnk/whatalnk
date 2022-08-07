import argparse
import dis
import marshal


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("input")
    args = parser.parse_args()
    # python -m compileall main.py
    # default output: __pucache__/main.cpython-38.pyc
    input_file = args.input
    with open(input_file, "rb") as f:
        raw_code = f.read()
    # offset is differrent depending on python version; 8, 12, etc.
    # In this case (Python 3.8.13), it is 16
    code = marshal.loads(raw_code[16:])
    dis.dis(code)
