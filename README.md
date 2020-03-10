# Stress Server

This is a docker container with the `stgress` command line installed, and
a webserver that can run stress calls with options.

## Usage

Start the server:

```shell
$ docker run --rm -it -p 3000:3000 dannyben/stress-server
```

Call `stress` with any option you would normally use in the command line,
only replace spaces with a `+` sign:

For example, if you wish to perform this command:

```shell
$ stress -c 1 -m 1 -t 10
```

Use this URL:

```shell
$ curl "http://localhost:3000/-c+1+-m+1+-t+10"
```
