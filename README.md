# ElixirTw

[![Ebert](https://ebertapp.io/github/elixirtw/elixir_tw.svg)](https://ebertapp.io/github/elixirtw/elixir_tw)

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
    * If you want to use Docker for PostgreSQL in local development
    * Start PostgreSQL server with `docker-compose up -d`
    * Override default usename for Phoenix to log in PostgreSQL with `export PGUSER=postgres`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Testing

This project includes `test.watch`, `credo`, and `dialyxer`. You can run the test simply with:
`mix test.watch`

to run type checking with `dialyxer`:
`mix dialyzer --plt`
first, then simply
`mix dialyzer`
after.

<!--Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).-->
## Building a release
  * `docker build -t elixir_tw .`
  * `docker run -it -d elixir_tw:latest bash`
  * `docker cp <IMAGE_ID>:/app/rel/elixir_tw/releases ./rel/docker_rel`
  * `docker rm -f <IMAGE_ID>`

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
