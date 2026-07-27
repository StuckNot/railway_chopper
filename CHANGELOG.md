# Changelog

## v0.1.0

Initial release.

- `buildChopperClient` — pre-configured Chopper client factory, accepts `http.Client?`, `Converter?`, `ErrorConverter?`, and default headers
- `NetworkFailure` — sealed, freezed union covering `network`, `timeout`, `server`, `clientError`, `unauthorized`, `unknown`
- `mapResponse` — wraps a Chopper request and returns `Either<NetworkFailure, T>`
