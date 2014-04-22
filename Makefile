all:
	@ghc -package base -package containers -package array -ilib/transformers-0.3.0.0 -ilib/mtl-2.1.3.1 -ilib/either --make -o mjc -isrc -O1 src/Driver.hs -hide-all-packages -XMultiParamTypeClasses -XFunctionalDependencies -XFlexibleInstances

.PHONY: clean

clean:
	@find . -name "*.o" -delete
	@find . -name "*.hi" -delete
	@rm mjc *.s &> /dev/null
