import 'package:railway_chopper/railway_chopper.dart';
import 'package:test/test.dart';

void main() {
  test('NetworkFailure variants are value-equal', () {
    expect(
      const NetworkFailure.unauthorized(),
      const NetworkFailure.unauthorized(),
    );
    expect(
      const NetworkFailure.server(statusCode: 500),
      isNot(const NetworkFailure.server(statusCode: 503)),
    );
  });
}

//1. Test if correct mapping is happening for all exceptions
//2. failures are immutable, value equals, toString works
