import 'package:chopper/chopper.dart';
import 'package:fpdart/fpdart.dart';
import 'package:railway_chopper/railway_chopper.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  Response<String> buildSubject(int statusCode) =>
      Response<String>(http.Response('', statusCode), null);

  group('failureForStatusCode test', () {
    test('status code 200 (success)', () async {
      final response = Response<String>(http.Response('', 200), 'hello');
      final mockSuccess = await Future.value(response).toEither();
      expect(mockSuccess, Either.right('hello'));
    });
    test('status code 203 (success)', () async {
      final response = Response<String>(http.Response('', 203), 'hello');
      final mockSuccess = await Future.value(response).toEither();
      expect(mockSuccess, Either.right('hello'));
    });
    test('status code 401', () async {
      final mockFailure = await Future.value(buildSubject(401)).toEither();
      expect(mockFailure, Either.left(NetworkFailure.unauthorized()));
    });
    test('status code 502', () async {
      final mockFailure = await Future.value(buildSubject(502)).toEither();
      expect(mockFailure, Either.left(NetworkFailure.server(statusCode: 502)));
    });
    test('status code 301', () async {
      final mockFailure = await Future.value(buildSubject(301)).toEither();
      expect(mockFailure, Either.left(NetworkFailure.unknown()));
    });
    test('status code 403', () async {
      final mockFailure = await Future.value(buildSubject(403)).toEither();
      expect(
        mockFailure,
        Either.left(NetworkFailure.clientError(statusCode: 403)),
      );
    });
  });
}
