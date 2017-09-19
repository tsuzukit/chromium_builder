Build chrom driver based on instruction from this page

https://chromium.googlesource.com/chromium/src/+/master/docs/linux_build_instructions.md#notes


# How to build chromedriver

```
# Enter to container
$ sh script/run.sh

# Build chromedriver
$ ninja -C out/Default chromedriver
```

# How to copy files from container to local

```
$ sudo docker cp <コンテナID>:/root/src/out/Default/chromedriver chromedriver
```
