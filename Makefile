all: ; @ghc  --make -o mjc -isrc -O2 src/Driver.hs # -hide-package monads-tf
clean: ; @rm src/*.hi src/*.o mjc &> /dev/null
