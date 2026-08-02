import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' show ClientException;
import '../failures/network_failure.dart';

/// Converts a chopper [Response] into `Either<NetworkFailure, T>`, the
/// boundary every repository in every feature package returns across.
extension ResponseToEither<T> on Future<Response<T>> {
  Future<Either<NetworkFailure, T>> toEither() async {
    try {
      final response = await this;
      if (response.isSuccessful) {
        return right(response.body as T);
      }
      return left(_failureForStatusCode(response.statusCode));
    } on TimeoutException catch (_) {
      return left(const NetworkFailure.timeout());
    } on ClientException catch (_) {
      return left(const NetworkFailure.network());
    } on Exception catch (e) {
      if (e.toString().contains('SocketException') ||
          e.runtimeType.toString().contains('SocketException')) {
        return left(const NetworkFailure.network());
      }
      return left(NetworkFailure.unknown(error: e));
    }
  }
}

/// Maps a chopper [Response] to `Either<NetworkFailure, T>`.
///
/// Deprecated in favor of [ResponseToEither.toEither] extension method.
/// Will be removed in version 0.3.0.
@Deprecated(
  'Use .toEither() extension on Future<Response<T>> instead. Will be removed in 0.3.0.',
)
Future<Either<NetworkFailure, T>> mapResponse<T>(
  Future<Response<T>> Function() request,
) async {
  try {
    return await request().toEither();
  } catch (e) {
    if (e is Exception) {
      return left(NetworkFailure.unknown(error: e));
    }
    rethrow;
  }
}

NetworkFailure _failureForStatusCode(int statusCode) {
  if (statusCode == 401) return const NetworkFailure.unauthorized();
  if (statusCode >= 500) {
    return NetworkFailure.server(statusCode: statusCode);
  }
  if (statusCode >= 400) {
    return NetworkFailure.clientError(statusCode: statusCode);
  }
  return NetworkFailure.unknown();
}
