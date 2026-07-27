# railway

Shared network infrastructure for Atomise Flutter apps: a `chopper` client
factory, and a `Response -> Either<NetworkFailure, T>` mapper.

This package owns **no business logic and no DTOs**. It is feature-agnostic so any number of features
can depend on it without it ever depending back on them.

## What's in here

| Export | Purpose |
| --- | --- |
| `buildChopperClient` | Builds a configured `ChopperClient` (base url, JSON conversion, interceptors). Feature packages attach their generated `@ChopperApi` services to it. |
| `NetworkFailure` | Sealed, freezed union of transport-level failures: `network`, `timeout`, `server`, `unauthorized`, `unknown`. |
| `mapResponse` | Wraps a chopper request, returning `Either<NetworkFailure, T>`. |

## What's NOT in here

- **Auth interception** — token injection and 401 refresh are owned by 
  atomise_auth, which depends on this package. Auth is a feature concern,
  not a transport concern.
- **DTOs / swagger-generated models** — these belong in each feature
  package's own `data/dto/`, generated against that feature's API spec.
- **Domain failures** — `NetworkFailure` is an infra-layer type. Each
  feature's repository implementation maps it into its own domain failure
  (e.g. `AuthFailure`) before it reaches `domain/`/`presentation/`.
- Anything specific to a single feature or client. If a feature needs
  different behavior, it implements an interface (`TokenProvider`) or
  injects a callback (`onUnauthorized`) — it never forks this package.

## Usage

```dart
// Build a client and attach a generated chopper service
final client = buildChopperClient(
  baseUrl: 'https://api.atomise.com',
  httpClient: myHttpClient,
  converter: MyService.$JsonSerializableConverter(),
);

// Attach a generated chopper API service to `client`, then in a repository:
final result = await mapResponse(() => myApi.getSomething());
result.match(
  (failure) => /* handle NetworkFailure */,
  (data) => /* use data */,
);
```
For authenticated clients, use buildAuthenticatedChopperClient from atomise_auth — it wraps this factory and injects token handling internally.


## Versioning

Consumed via pinned git tags, not a moving branch:

```yaml
dependencies:
  railway:
    git:
      url: <railway-repo-url>
      ref: v0.1.0
```

Each client app/feature package pins its own `ref` independently — bumping
one consumer doesn't force an upgrade on another. This package is the most
depended-upon in the catalog, so its public API (the exports listed above)
changes reluctantly and follows semver: PATCH for fixes, MINOR for additive
changes, MAJOR for breaking changes to the public surface.

## Development

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # regen freezed code
flutter analyze
flutter test
```

Generated code (`*.freezed.dart`) is committed — consumers pull this
package via git and don't run codegen themselves.
