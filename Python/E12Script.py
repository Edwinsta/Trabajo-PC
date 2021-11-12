import descifradoCesar
import CrackeoCesar
import cifradoCesar
import argparse

if __name__=='__main__':
  parser = argparse.ArgumentParser()
  parser.add_argument('-mode', '--modo',
                    type=str,
                    choices=['c', 'd', 'ck'],
                    default='c', required=False,)
  args = parser.parse_args()
  if args.modo == 'c':
    cif = cifradoCesar()
    parser.add_argument('-m', dest='--mensaje', help='message')
    parser.add_argument('-pc', dest='--palabra', help='clave')
  elif args.modo == 'd':
    descif = descifradoCesar()
    parser.add_argument('-m', dest='--mensaje', help='message')
    parser.add_argument('-pc', dest='--palabra', help='clave')
  elif args.modo == 'ck':
    crackeo = CrackeoCesar()
    parser.add_argument('-m', dest='--mensaje', help='message')