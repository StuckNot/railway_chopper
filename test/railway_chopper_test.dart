import 'package:railway_chopper/railway_chopper.dart';
import 'package:flutter_test/flutter_test.dart';

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
