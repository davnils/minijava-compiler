all: ; @ghc --make -o mjc -isrc -O2 src/Driver.hs
clean: ; @rm src/*.hi src/*.o mjc &> /dev/null
