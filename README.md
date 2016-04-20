# git2go-build
This small library allows you to build [Git2go](https://github.com/libgit2/git2go) linking it statically with it's dependancies. This is well-suited for people who want use Git2go on their project and have one binary that doesn't require any dynamic libraries.

##Dependancies
Here is the list of dependancies that Git2go requires to make static linking possible.

 * Libgit2 [https://github.com/libgit2/libgit2.git](https://github.com/libgit2/libgit2.git)
 * OpenSSL [https://github.com/sithembiso/openssl.git](https://github.com/sithembiso/openssl.git)
 * Libssh2 [https://github.com/sithembiso/libssh2.git](https://github.com/sithembiso/libssh2.git)
 * Http-parser [https://github.com/sithembiso/http-parser.git](https://github.com/sithembiso/http-parser.git)
 
## How to install
You can install `git2go-build` just like any other go package:
```
go get github.com/sithembiso/git2go-build
```
Note that `git2go-build` compiles Git2go by loading the dependancies as submodules. To make sure that these libraries are present, run the following command inside the package you just installed (It should be in your $GOPATH/src):
```
git submodule update --init
```
After git is done fetching the dependancies, you should have the directories `http-parser`, `openssl` and `libssh2` (`libgit2` will be loaded below).

## Preparing Git2go
The last preparation step is to ensure that Git2go is install downloaded. To do that, simply run:
```
go get github.com/libgit2/git2go
```
This will add Git2go to your `$GOPATH`.

To build Git2go statically, you need to checkout the correct branch (`next`). Please see the Git2go's README file for datails (if you have to). Do the checkout (inside the `git2go` package in your `$GOPATH/src`):
```
git checkout next
```
From the steps above, we are still missing `libgit2` as a dependancy. To load it, run:
```
git submodule update --init
```
You should now have `libgit2` inside the directory `vendor/libgit2`.
We are now ready to build Git2go statically.

## Build Git2go
To build and install Git2go, switch to the `git2go-build` directory and run the following command:
```
make install
```
You can now run write you app using `git2go` as a library.

## Licence
Use as you please. Just don't violate the licences on the libraries being referenced above.