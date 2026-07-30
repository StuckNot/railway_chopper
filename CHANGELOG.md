# Changelog

## v0.2.0

### Breaking
- `mapResponse` removed. Replaced by `toEither`, an extension on `Future<Response<T>>` — call sites change from `mapResponse(() => myApi.getSomething())` to `myApi.getSomething().toEither()`.

### Added
- Web platform support — `response_mapper.dart` no longer imports `dart:io`; catches `http.ClientException` instead of `SocketException` (covers both native and web transports).
- Test cases for better coverage

### Changed
- README expanded with a "Why railway_chopper over plain chopper?" comparison and a full `NetworkFailure` variant table.
- Added a `style: lints` badge.

## v0.1.0

Initial release.

- `buildChopperClient` — pre-configured Chopper client factory, accepts `http.Client?`, `Converter?`, `ErrorConverter?`, and default headers
- `NetworkFailure` — sealed, freezed union covering `network`, `timeout`, `server`, `clientError`, `unauthorized`, `unknown`
- `mapResponse` — wraps a Chopper request and returns `Either<NetworkFailure, T>`
