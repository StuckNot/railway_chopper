import 'dart:async';
import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:fpdart/fpdart.dart';
import '../failures/network_failure.dart';

/// Maps a chopper [Response] to `Either<NetworkFailure, T>`, the boundary
/// every repository in every feature package returns across.
Future<Either<NetworkFailure, T>> mapResponse<T>(
  Future<Response<T>> Function() request,
) async {
  try {
    final response = await request();
    if (response.isSuccessful) {
      return right(response.body as T);
    }
    return left(_failureForStatusCode(response.statusCode));
  } on TimeoutException catch (_) {
    return left(const NetworkFailure.timeout());
  } on SocketException catch(_){
    return left(const NetworkFailure.network());
  } on Exception catch (e) {
    return left(NetworkFailure.unknown(error: e));
  }
}

NetworkFailure _failureForStatusCode(int statusCode) {
  if (statusCode == 401) return const NetworkFailure.unauthorized();
  if (statusCode >= 500) {return NetworkFailure.server(statusCode: statusCode);}
  if(statusCode>=400){return NetworkFailure.clientError(statusCode: statusCode);}
  return NetworkFailure.unknown();
}
