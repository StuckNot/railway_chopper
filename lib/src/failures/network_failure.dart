import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_failure.freezed.dart';

@freezed
sealed class NetworkFailure with _$NetworkFailure {
  const factory NetworkFailure.network() = NetworkNetworkFailure;
  const factory NetworkFailure.timeout() = NetworkTimeoutFailure;
  const factory NetworkFailure.clientError({int? statusCode, String? message}) = NetworkClientFailure;
  const factory NetworkFailure.server({int? statusCode, String? message}) =
      NetworkServerFailure;
  const factory NetworkFailure.unauthorized() = NetworkUnauthorizedFailure;
  const factory NetworkFailure.unknown({Object? error}) =
      NetworkUnknownFailure;
}
