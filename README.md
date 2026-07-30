# railway_chopper

[![pub package](https://img.shields.io/pub/v/railway_chopper.svg)](https://pub.dev/packages/railway_chopper)
[![pub points](https://img.shields.io/pub/points/railway_chopper)](https://pub.dev/packages/railway_chopper/score)
[![CI](https://github.com/StuckNot/railway_chopper/actions/workflows/ci.yml/badge.svg)](https://github.com/StuckNot/railway_chopper/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/StuckNot/railway_chopper/branch/main/graph/badge.svg)](https://codecov.io/gh/StuckNot/railway_chopper)
[![style: lints](https://img.shields.io/badge/style-lints-4BC0F5.svg)](https://pub.dev/packages/lints)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A `chopper` client factory and a `Response -> Either<NetworkFailure, T>` mapper for railway-oriented error handling in Flutter/Dart.

## How it works

1. Build a `ChopperClient` with `buildChopperClient(baseUrl: ...)` — same setup as plain chopper.
2. Attach your generated `@ChopperApi` service to it, same as any chopper client.
3. Call `.toEither()` on any request. You get back `Either<NetworkFailure, T>` — `Right(data)` on success, or `Left(failure)` on failure, with the failure type **assigned automatically** from what actually went wrong (timed out, no connection, `401`, another `4xx`, a `5xx`, or anything else) — no manual status-code checking at the call site.

## Why railway_chopper over plain chopper?

Without it, every call site ends up hand-rolling its own error handling, and the classification logic drifts slightly differently each time it's copy-pasted:

```dart
try {
  final response = await myApi.getSomething();
  if (response.isSuccessful) {
    return response.body!;
  }
  if (response.statusCode == 401) {
    // handle unauthorized
  } else if (response.statusCode >= 500) {
    // handle server error
  }
  // ...repeated, slightly differently, at every call site
} on TimeoutException {
  // handle timeout
} on ClientException {
  // handle network failure
}
```

`toEither` centralizes that branching once, so every call site gets the same, consistent `NetworkFailure` classification for free, and the failure-handling logic lives in exactly one place instead of N slightly-different copies:

```dart
final result = await myApi.getSomething().toEither();
result.match(
  (failure) => /* one exhaustive switch, not copy-pasted per call site */,
  (data) => /* use data */,
);
```

## What is "Railway Oriented Programming"?

Railway Oriented Programming (ROP) is a functional pattern for modeling a chain of operations that can each succeed or fail, without littering your code with `try`/`catch` or null checks at every step. Picture two parallel tracks: a "success" track and a "failure" track. Each step runs on the success track, and the moment one step fails, execution switches to the failure track and every later step is skipped — the failure rides straight through to the end untouched.

In Dart, `Either<L, R>` (from `fpdart`) is the type that represents this: `Left` for failure, `Right` for success. `railway_chopper` builds that pattern on top of `chopper`, so every network call resolves into a single, well-typed `Either<NetworkFailure, T>` — you handle failure once, at the end of the chain, instead of after every call.

This package owns **no business logic and no DTOs**. It's feature-agnostic, so any number of features in an app can depend on it without depending on each other through it.

## Installation

```yaml
dependencies:
  railway_chopper: ^0.2.0
```

## Usage

```dart
// Build a client and attach a generated chopper service
final client = buildChopperClient(
  baseUrl: 'https://api.example.com',
  httpClient: myHttpClient,
  converter: MyService.$JsonSerializableConverter(),
);

// Attach a generated chopper API service to `client`, then in a repository:
final result = await myApi.getSomething().toEither();
result.match(
  (failure) => /* handle NetworkFailure */,
  (data) => /* use data */,
);
```

A full runnable version (hitting a real public API, no codegen required) is in [`example/main.dart`](example/main.dart) — run it with `dart run example/main.dart`.

## What's in here

| Export | Purpose |
| --- | --- |
| `buildChopperClient` | Builds a configured `ChopperClient` (base url, JSON conversion, interceptors). Attach your generated `@ChopperApi` services to it. |
| `NetworkFailure` | Sealed, freezed union of transport-level failures — see below. |
| `toEither` | Extension on `Future<Response<T>>` — converts a chopper request into `Either<NetworkFailure, T>`. |

### `NetworkFailure` variants

| Variant | When |
| --- | --- |
| `NetworkFailure.network()` | The request never reached the server — DNS failure, connection refused, offline device. |
| `NetworkFailure.timeout()` | The request exceeded its configured timeout. |
| `NetworkFailure.unauthorized()` | Response status was `401`. |
| `NetworkFailure.clientError({statusCode, message})` | Response status was `4xx` (excluding `401`). |
| `NetworkFailure.server({statusCode})` | Response status was `5xx`. |
| `NetworkFailure.unknown({error})` | An unrecognized status code, or any other unexpected exception. |

## What's NOT in here

- **Auth interception** — token injection and 401 refresh are a feature/app concern, not a transport concern. Wire your own `Interceptor` into `buildChopperClient`'s `interceptors` param instead of forking this package.
- **DTOs / swagger-generated models** — these belong in each feature's own data layer, generated against that feature's API spec.
- **Domain failures** — `NetworkFailure` is an infra-layer type. Map it into your own domain failure type (e.g. `AuthFailure`) before it reaches your domain/presentation layers.
- Anything specific to a single feature or client. If a feature needs different behavior, it implements an interface or injects a callback — it never forks this package.

## Versioning

Follows semver: PATCH for fixes, MINOR for additive changes, MAJOR for breaking changes to the public surface (the exports listed above).

---

## Contributing

Everything below is for working on this package itself — not needed if you're just using it as a dependency.

```bash
dart pub get
dart run build_runner build --delete-conflicting-outputs   # regen freezed code
dart analyze
dart test
```

Generated code (`*.freezed.dart`) is committed — consumers don't need to run codegen themselves.
