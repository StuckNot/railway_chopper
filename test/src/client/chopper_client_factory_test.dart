import 'package:chopper/chopper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:railway_chopper/railway_chopper.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

void main() {
  const url = 'https://api.example.com';

  group('buildChopperClient test cases', () {
    test('url parsing', () {
      final client = buildChopperClient(baseUrl: url);
      expect(client.baseUrl, Uri.parse(url));
    });

    test('correct httpClient passed', () {
      final httpMock = MockHttpClient();
      final client = buildChopperClient(baseUrl: url, httpClient: httpMock);
      expect(client.httpClient, same(httpMock));
    });

    test('HeaderInterceptor not added when defaultHeaders is empty', () {
      final client = buildChopperClient(baseUrl: url);
      expect(client.interceptors.whereType<HeadersInterceptor>(), isEmpty);
    });

    test('HeaderInterceptor added when defaultHeaders is not empty', () {
      final mockHeaders = {'abc': 'xyz'};
      final client = buildChopperClient(
        baseUrl: url,
        defaultHeaders: mockHeaders,
      );
      final headersInterceptor = client.interceptors
          .whereType<HeadersInterceptor>()
          .single;
      expect(headersInterceptor.headers, mockHeaders);
    });
  });
}
