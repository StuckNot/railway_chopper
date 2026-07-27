// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkFailure()';
}


}

/// @nodoc
class $NetworkFailureCopyWith<$Res>  {
$NetworkFailureCopyWith(NetworkFailure _, $Res Function(NetworkFailure) __);
}


/// Adds pattern-matching-related methods to [NetworkFailure].
extension NetworkFailurePatterns on NetworkFailure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NetworkNetworkFailure value)?  network,TResult Function( NetworkTimeoutFailure value)?  timeout,TResult Function( NetworkClientFailure value)?  clientError,TResult Function( NetworkServerFailure value)?  server,TResult Function( NetworkUnauthorizedFailure value)?  unauthorized,TResult Function( NetworkUnknownFailure value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NetworkNetworkFailure() when network != null:
return network(_that);case NetworkTimeoutFailure() when timeout != null:
return timeout(_that);case NetworkClientFailure() when clientError != null:
return clientError(_that);case NetworkServerFailure() when server != null:
return server(_that);case NetworkUnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case NetworkUnknownFailure() when unknown != null:
return unknown(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NetworkNetworkFailure value)  network,required TResult Function( NetworkTimeoutFailure value)  timeout,required TResult Function( NetworkClientFailure value)  clientError,required TResult Function( NetworkServerFailure value)  server,required TResult Function( NetworkUnauthorizedFailure value)  unauthorized,required TResult Function( NetworkUnknownFailure value)  unknown,}){
final _that = this;
switch (_that) {
case NetworkNetworkFailure():
return network(_that);case NetworkTimeoutFailure():
return timeout(_that);case NetworkClientFailure():
return clientError(_that);case NetworkServerFailure():
return server(_that);case NetworkUnauthorizedFailure():
return unauthorized(_that);case NetworkUnknownFailure():
return unknown(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NetworkNetworkFailure value)?  network,TResult? Function( NetworkTimeoutFailure value)?  timeout,TResult? Function( NetworkClientFailure value)?  clientError,TResult? Function( NetworkServerFailure value)?  server,TResult? Function( NetworkUnauthorizedFailure value)?  unauthorized,TResult? Function( NetworkUnknownFailure value)?  unknown,}){
final _that = this;
switch (_that) {
case NetworkNetworkFailure() when network != null:
return network(_that);case NetworkTimeoutFailure() when timeout != null:
return timeout(_that);case NetworkClientFailure() when clientError != null:
return clientError(_that);case NetworkServerFailure() when server != null:
return server(_that);case NetworkUnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case NetworkUnknownFailure() when unknown != null:
return unknown(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  network,TResult Function()?  timeout,TResult Function( int? statusCode,  String? message)?  clientError,TResult Function( int? statusCode,  String? message)?  server,TResult Function()?  unauthorized,TResult Function( Object? error)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NetworkNetworkFailure() when network != null:
return network();case NetworkTimeoutFailure() when timeout != null:
return timeout();case NetworkClientFailure() when clientError != null:
return clientError(_that.statusCode,_that.message);case NetworkServerFailure() when server != null:
return server(_that.statusCode,_that.message);case NetworkUnauthorizedFailure() when unauthorized != null:
return unauthorized();case NetworkUnknownFailure() when unknown != null:
return unknown(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  network,required TResult Function()  timeout,required TResult Function( int? statusCode,  String? message)  clientError,required TResult Function( int? statusCode,  String? message)  server,required TResult Function()  unauthorized,required TResult Function( Object? error)  unknown,}) {final _that = this;
switch (_that) {
case NetworkNetworkFailure():
return network();case NetworkTimeoutFailure():
return timeout();case NetworkClientFailure():
return clientError(_that.statusCode,_that.message);case NetworkServerFailure():
return server(_that.statusCode,_that.message);case NetworkUnauthorizedFailure():
return unauthorized();case NetworkUnknownFailure():
return unknown(_that.error);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  network,TResult? Function()?  timeout,TResult? Function( int? statusCode,  String? message)?  clientError,TResult? Function( int? statusCode,  String? message)?  server,TResult? Function()?  unauthorized,TResult? Function( Object? error)?  unknown,}) {final _that = this;
switch (_that) {
case NetworkNetworkFailure() when network != null:
return network();case NetworkTimeoutFailure() when timeout != null:
return timeout();case NetworkClientFailure() when clientError != null:
return clientError(_that.statusCode,_that.message);case NetworkServerFailure() when server != null:
return server(_that.statusCode,_that.message);case NetworkUnauthorizedFailure() when unauthorized != null:
return unauthorized();case NetworkUnknownFailure() when unknown != null:
return unknown(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class NetworkNetworkFailure implements NetworkFailure {
  const NetworkNetworkFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkNetworkFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkFailure.network()';
}


}




/// @nodoc


class NetworkTimeoutFailure implements NetworkFailure {
  const NetworkTimeoutFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkTimeoutFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkFailure.timeout()';
}


}




/// @nodoc


class NetworkClientFailure implements NetworkFailure {
  const NetworkClientFailure({this.statusCode, this.message});
  

 final  int? statusCode;
 final  String? message;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkClientFailureCopyWith<NetworkClientFailure> get copyWith => _$NetworkClientFailureCopyWithImpl<NetworkClientFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkClientFailure&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,statusCode,message);

@override
String toString() {
  return 'NetworkFailure.clientError(statusCode: $statusCode, message: $message)';
}


}

/// @nodoc
abstract mixin class $NetworkClientFailureCopyWith<$Res> implements $NetworkFailureCopyWith<$Res> {
  factory $NetworkClientFailureCopyWith(NetworkClientFailure value, $Res Function(NetworkClientFailure) _then) = _$NetworkClientFailureCopyWithImpl;
@useResult
$Res call({
 int? statusCode, String? message
});




}
/// @nodoc
class _$NetworkClientFailureCopyWithImpl<$Res>
    implements $NetworkClientFailureCopyWith<$Res> {
  _$NetworkClientFailureCopyWithImpl(this._self, this._then);

  final NetworkClientFailure _self;
  final $Res Function(NetworkClientFailure) _then;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? statusCode = freezed,Object? message = freezed,}) {
  return _then(NetworkClientFailure(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class NetworkServerFailure implements NetworkFailure {
  const NetworkServerFailure({this.statusCode, this.message});
  

 final  int? statusCode;
 final  String? message;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkServerFailureCopyWith<NetworkServerFailure> get copyWith => _$NetworkServerFailureCopyWithImpl<NetworkServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkServerFailure&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,statusCode,message);

@override
String toString() {
  return 'NetworkFailure.server(statusCode: $statusCode, message: $message)';
}


}

/// @nodoc
abstract mixin class $NetworkServerFailureCopyWith<$Res> implements $NetworkFailureCopyWith<$Res> {
  factory $NetworkServerFailureCopyWith(NetworkServerFailure value, $Res Function(NetworkServerFailure) _then) = _$NetworkServerFailureCopyWithImpl;
@useResult
$Res call({
 int? statusCode, String? message
});




}
/// @nodoc
class _$NetworkServerFailureCopyWithImpl<$Res>
    implements $NetworkServerFailureCopyWith<$Res> {
  _$NetworkServerFailureCopyWithImpl(this._self, this._then);

  final NetworkServerFailure _self;
  final $Res Function(NetworkServerFailure) _then;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? statusCode = freezed,Object? message = freezed,}) {
  return _then(NetworkServerFailure(
statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class NetworkUnauthorizedFailure implements NetworkFailure {
  const NetworkUnauthorizedFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkUnauthorizedFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkFailure.unauthorized()';
}


}




/// @nodoc


class NetworkUnknownFailure implements NetworkFailure {
  const NetworkUnknownFailure({this.error});
  

 final  Object? error;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkUnknownFailureCopyWith<NetworkUnknownFailure> get copyWith => _$NetworkUnknownFailureCopyWithImpl<NetworkUnknownFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkUnknownFailure&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'NetworkFailure.unknown(error: $error)';
}


}

/// @nodoc
abstract mixin class $NetworkUnknownFailureCopyWith<$Res> implements $NetworkFailureCopyWith<$Res> {
  factory $NetworkUnknownFailureCopyWith(NetworkUnknownFailure value, $Res Function(NetworkUnknownFailure) _then) = _$NetworkUnknownFailureCopyWithImpl;
@useResult
$Res call({
 Object? error
});




}
/// @nodoc
class _$NetworkUnknownFailureCopyWithImpl<$Res>
    implements $NetworkUnknownFailureCopyWith<$Res> {
  _$NetworkUnknownFailureCopyWithImpl(this._self, this._then);

  final NetworkUnknownFailure _self;
  final $Res Function(NetworkUnknownFailure) _then;

/// Create a copy of NetworkFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(NetworkUnknownFailure(
error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
