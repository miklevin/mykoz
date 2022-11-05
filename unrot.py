import codecs
import argparse

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('--input')
parser.add_argument('--output')
args = parser.parse_args()

print(args.input, args.output)

with open(args.input, "r") as fh:
    data = fh.readlines()

with open(args.output, "w") as fh:
    lines = [codecs.encode(x, 'rot_13') for x in data]
    fh.writelines(lines)
