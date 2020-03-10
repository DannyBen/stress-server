# Stress Server

This is a docker container with the `stgress` command line installed, and
a webserver that can run stress calls with options.

## Usage

Start the server:

```shell
$ docker run --rm -it -p 3000:3000 dannyben/stress-test
```

Call `stress` with any option:

```shell
$ curl "http://localhost:3000/-c 1 -m 1 -t 10"
```



