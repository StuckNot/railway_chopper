import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:fpdart/fpdart.dart';
import 'package:railway_chopper/railway_chopper.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  Response<String> buildErrorSubject(int statusCode) =>
      Response<String>(http.Response('', statusCode), null);

  Future<Either<NetworkFailure, String>> buildSuccessSubject(
    int statusCode,
  ) async {
    final response = Response<String>(http.Response('', statusCode), 'hello');
    final mockSuccess = await Future.value(response).toEither();
    return mockSuccess;
  }

  group('failureForStatusCode test', () {
    test('status code 200 (success)', () async {
      final result = await buildSuccessSubject(200);
      expect(result, Either.right('hello'));
    });
    test('status code 203 (success)', () async {
      final result = await buildSuccessSubject(203);
      expect(result, Either.right('hello'));
    });
    test('status code 401', () async {
      final mockFailure = await Future.value(buildErrorSubject(401)).toEither();
      expect(mockFailure, Either.left(NetworkFailure.unauthorized()));
    });
    test('status code 502', () async {
      final mockFailure = await Future.value(buildErrorSubject(502)).toEither();
      expect(mockFailure, Either.left(NetworkFailure.server(statusCode: 502)));
    });
    test('status code 301', () async {
      final mockFailure = await Future.value(buildErrorSubject(301)).toEither();
      expect(mockFailure, Either.left(NetworkFailure.unknown()));
    });
    test('status code 403', () async {
      final mockFailure = await Future.value(buildErrorSubject(403)).toEither();
      expect(
        mockFailure,
        Either.left(NetworkFailure.clientError(statusCode: 403)),
      );
    });
    test('on TimeoutException', () async {
      final result = await Future<Response<String>>.error(
        TimeoutException('timed out'),
      ).toEither();
      expect(result, Either.left(NetworkFailure.timeout()));
    });

    test('on ClientException', () async {
      final result = await Future<Response<String>>.error(
        http.ClientException('message'),
      ).toEither();
      expect(result, Either.left(NetworkFailure.network()));
    });

    test('on Exception', () async {
      final exception = Exception('boom');
      final result = await Future<Response<String>>.error(
        exception,
      ).toEither();
      expect(result, Either.left(NetworkFailure.unknown(error: exception)));
    });
  });
}
