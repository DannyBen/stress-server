# Stress Server

This is a docker container with the `stgress` command line installed, and
a webserver that can run stress calls with options.

It was designed to help in testing and debugging auto scaling configurations.

## Usage

Start the server:

```shell
$ docker run --rm -it -p 3000:3000 dannyben/stress-server
```

Use one of the endpoints below to run the `stress` command on the server.

## Notes

- The server streams its output back to your client. It is recommended you invoke your calls with a streaming option (for example, `--no-buffer` in `curl`).
- It is recommended to run all your calls with the `timeout` option set, otherwise, you might need to restart the server in order to stop the `stress` process.
- **You should not run this server in production environments**.

### `GET /help`

Show the output of `stress --help`:

```shell
$ curl http://localhost:3000/help
```

### `GET /raw/:options`

This endpoint runs the `stress` command using options in the same syntax as you would normally provide them in the command line. When using `curl` or other HTTP client that does not like spaces in the URL, simply replace the spaces with a `+` sign.

For example, if you wish to perform this command:

```shell
$ stress -c 1 -m 1 --verbose -t 10
```

Use this URL:

```shell
$ curl --no-buffer "http://localhost:3000/raw/-c+1+-m+1+--verbose+-t+10"
```

### `GET /stress`

This is the primary endpoint. It accepts all the arguments accepted by the `stress` command line interface, as query string parameters. You may use either the long or short form.

For example, if you wish to perform this command:

```powershell
$ stress -c 1 -m 1 --verbose -t 10
```

Use this URL:

```shell
$ curl --no-buffer "http://localhost:3000/stress?c=1&m=1&verbose=1&t=10"
```

Flags with a hyphen, like `--dry-run` may be expressed with either a hyphen (`dry-run=1`) or an underscore (`dry_run=1`)

## Development

To run the server in the development:

```shell
$ bundle exec rackup -s thin -p 3000 -o 0.0.0.0
```

Or, if you have [opcode](https://github.com/dannyben/opcode):

```shell
$ op serve
```

To run the dockerized version of the server:

```shell
$ docker-compose up web
```

