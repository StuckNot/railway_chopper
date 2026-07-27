import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;

/// Builds a [ChopperClient] preconfigured with JSON conversion and the
/// given interceptors (e.g. [AuthInterceptor]).
///
/// Feature packages attach their own generated `@ChopperApi` services to
/// the returned client; this factory is the only place base url / headers
/// / interceptor wiring happens.
///
/// [converter]/[errorConverter] default to chopper's plain [JsonConverter],
/// which only decodes into `Map`/`List` — swagger-generated clients ship
/// their own `$JsonSerializableConverter` (per spec file) that knows how to
/// call each DTO's `fromJson`. Pass that in here when attaching a generated
/// service; the plain default is only adequate when no typed DTOs are
/// involved.
ChopperClient buildChopperClient({
  required String baseUrl,
  List<Interceptor> interceptors = const [],
  Map<String, dynamic> defaultHeaders = const {},
  http.Client? httpClient,
  Converter? converter,
  ErrorConverter? errorConverter,
}) {
  return ChopperClient(
    baseUrl: Uri.parse(baseUrl),
    client: httpClient,
    interceptors: [
      if (defaultHeaders.isNotEmpty)
        HeadersInterceptor(
          defaultHeaders.map((key, value) => MapEntry(key, value.toString())),
        ),
      ...interceptors,
    ],
    converter: converter ?? const JsonConverter(),
    errorConverter: errorConverter ?? const JsonConverter(),
  );
}
