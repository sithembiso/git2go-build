default: test

build-openssl:
	./build-openssl-static.sh

build-libssh2:
	./build-libssh2-static.sh

build-libgit2:
	./build-libgit2-static.sh

build-httpparser:
	./build-http-parser-static.sh

test: build-httpparser build-openssl build-libssh2 build-libgit2 
	cd ../../libgit2/git2go/ ; go run script/check-MakeGitError-thread-lock.go
	./with-static-all.sh go test ../../libgit2/git2go

install: build-openssl build-httpparser build-libssh2 build-libgit2
	./with-static-all.sh go install ../../libgit2/git2go