// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CheckoutState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckoutState()';
  }
}

/// @nodoc
class $CheckoutStateCopyWith<$Res> {
  $CheckoutStateCopyWith(CheckoutState _, $Res Function(CheckoutState) __);
}

/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddressLoaded value)? addressLoaded,
    TResult Function(_Selected value)? selected,
    TResult Function(_SuccessGet value)? successGet,
    TResult Function(_SuccessSet value)? successSet,
    TResult Function(_Failure value)? failure,
    TResult Function(_MakingPayment value)? makingPayment,
    TResult Function(_PaymentSuccess value)? paymentSuccess,
    TResult Function(_PaymentFailure value)? paymentFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _AddressLoaded() when addressLoaded != null:
        return addressLoaded(_that);
      case _Selected() when selected != null:
        return selected(_that);
      case _SuccessGet() when successGet != null:
        return successGet(_that);
      case _SuccessSet() when successSet != null:
        return successSet(_that);
      case _Failure() when failure != null:
        return failure(_that);
      case _MakingPayment() when makingPayment != null:
        return makingPayment(_that);
      case _PaymentSuccess() when paymentSuccess != null:
        return paymentSuccess(_that);
      case _PaymentFailure() when paymentFailure != null:
        return paymentFailure(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddressLoaded value) addressLoaded,
    required TResult Function(_Selected value) selected,
    required TResult Function(_SuccessGet value) successGet,
    required TResult Function(_SuccessSet value) successSet,
    required TResult Function(_Failure value) failure,
    required TResult Function(_MakingPayment value) makingPayment,
    required TResult Function(_PaymentSuccess value) paymentSuccess,
    required TResult Function(_PaymentFailure value) paymentFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _AddressLoaded():
        return addressLoaded(_that);
      case _Selected():
        return selected(_that);
      case _SuccessGet():
        return successGet(_that);
      case _SuccessSet():
        return successSet(_that);
      case _Failure():
        return failure(_that);
      case _MakingPayment():
        return makingPayment(_that);
      case _PaymentSuccess():
        return paymentSuccess(_that);
      case _PaymentFailure():
        return paymentFailure(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddressLoaded value)? addressLoaded,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_SuccessGet value)? successGet,
    TResult? Function(_SuccessSet value)? successSet,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_MakingPayment value)? makingPayment,
    TResult? Function(_PaymentSuccess value)? paymentSuccess,
    TResult? Function(_PaymentFailure value)? paymentFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _AddressLoaded() when addressLoaded != null:
        return addressLoaded(_that);
      case _Selected() when selected != null:
        return selected(_that);
      case _SuccessGet() when successGet != null:
        return successGet(_that);
      case _SuccessSet() when successSet != null:
        return successSet(_that);
      case _Failure() when failure != null:
        return failure(_that);
      case _MakingPayment() when makingPayment != null:
        return makingPayment(_that);
      case _PaymentSuccess() when paymentSuccess != null:
        return paymentSuccess(_that);
      case _PaymentFailure() when paymentFailure != null:
        return paymentFailure(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PaymentModel> data)? addressLoaded,
    TResult Function(String method)? selected,
    TResult Function(String message)? successGet,
    TResult Function(String message)? successSet,
    TResult Function(String error)? failure,
    TResult Function()? makingPayment,
    TResult Function()? paymentSuccess,
    TResult Function(String error)? paymentFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _AddressLoaded() when addressLoaded != null:
        return addressLoaded(_that.data);
      case _Selected() when selected != null:
        return selected(_that.method);
      case _SuccessGet() when successGet != null:
        return successGet(_that.message);
      case _SuccessSet() when successSet != null:
        return successSet(_that.message);
      case _Failure() when failure != null:
        return failure(_that.error);
      case _MakingPayment() when makingPayment != null:
        return makingPayment();
      case _PaymentSuccess() when paymentSuccess != null:
        return paymentSuccess();
      case _PaymentFailure() when paymentFailure != null:
        return paymentFailure(_that.error);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PaymentModel> data) addressLoaded,
    required TResult Function(String method) selected,
    required TResult Function(String message) successGet,
    required TResult Function(String message) successSet,
    required TResult Function(String error) failure,
    required TResult Function() makingPayment,
    required TResult Function() paymentSuccess,
    required TResult Function(String error) paymentFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _AddressLoaded():
        return addressLoaded(_that.data);
      case _Selected():
        return selected(_that.method);
      case _SuccessGet():
        return successGet(_that.message);
      case _SuccessSet():
        return successSet(_that.message);
      case _Failure():
        return failure(_that.error);
      case _MakingPayment():
        return makingPayment();
      case _PaymentSuccess():
        return paymentSuccess();
      case _PaymentFailure():
        return paymentFailure(_that.error);
      case _:
        throw StateError('Unexpected subclass');
    }
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PaymentModel> data)? addressLoaded,
    TResult? Function(String method)? selected,
    TResult? Function(String message)? successGet,
    TResult? Function(String message)? successSet,
    TResult? Function(String error)? failure,
    TResult? Function()? makingPayment,
    TResult? Function()? paymentSuccess,
    TResult? Function(String error)? paymentFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _AddressLoaded() when addressLoaded != null:
        return addressLoaded(_that.data);
      case _Selected() when selected != null:
        return selected(_that.method);
      case _SuccessGet() when successGet != null:
        return successGet(_that.message);
      case _SuccessSet() when successSet != null:
        return successSet(_that.message);
      case _Failure() when failure != null:
        return failure(_that.error);
      case _MakingPayment() when makingPayment != null:
        return makingPayment();
      case _PaymentSuccess() when paymentSuccess != null:
        return paymentSuccess();
      case _PaymentFailure() when paymentFailure != null:
        return paymentFailure(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements CheckoutState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckoutState.initial()';
  }
}

/// @nodoc

class _Loading implements CheckoutState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckoutState.loading()';
  }
}

/// @nodoc

class _AddressLoaded implements CheckoutState {
  const _AddressLoaded(final List<PaymentModel> data) : _data = data;

  final List<PaymentModel> _data;
  List<PaymentModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddressLoadedCopyWith<_AddressLoaded> get copyWith =>
      __$AddressLoadedCopyWithImpl<_AddressLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressLoaded &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'CheckoutState.addressLoaded(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$AddressLoadedCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$AddressLoadedCopyWith(
          _AddressLoaded value, $Res Function(_AddressLoaded) _then) =
      __$AddressLoadedCopyWithImpl;
  @useResult
  $Res call({List<PaymentModel> data});
}

/// @nodoc
class __$AddressLoadedCopyWithImpl<$Res>
    implements _$AddressLoadedCopyWith<$Res> {
  __$AddressLoadedCopyWithImpl(this._self, this._then);

  final _AddressLoaded _self;
  final $Res Function(_AddressLoaded) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_AddressLoaded(
      null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>,
    ));
  }
}

/// @nodoc

class _Selected implements CheckoutState {
  const _Selected(this.method);

  final String method;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SelectedCopyWith<_Selected> get copyWith =>
      __$SelectedCopyWithImpl<_Selected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Selected &&
            (identical(other.method, method) || other.method == method));
  }

  @override
  int get hashCode => Object.hash(runtimeType, method);

  @override
  String toString() {
    return 'CheckoutState.selected(method: $method)';
  }
}

/// @nodoc
abstract mixin class _$SelectedCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$SelectedCopyWith(_Selected value, $Res Function(_Selected) _then) =
      __$SelectedCopyWithImpl;
  @useResult
  $Res call({String method});
}

/// @nodoc
class __$SelectedCopyWithImpl<$Res> implements _$SelectedCopyWith<$Res> {
  __$SelectedCopyWithImpl(this._self, this._then);

  final _Selected _self;
  final $Res Function(_Selected) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? method = null,
  }) {
    return _then(_Selected(
      null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SuccessGet implements CheckoutState {
  const _SuccessGet(this.message);

  final String message;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessGetCopyWith<_SuccessGet> get copyWith =>
      __$SuccessGetCopyWithImpl<_SuccessGet>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuccessGet &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CheckoutState.successGet(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SuccessGetCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$SuccessGetCopyWith(
          _SuccessGet value, $Res Function(_SuccessGet) _then) =
      __$SuccessGetCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$SuccessGetCopyWithImpl<$Res> implements _$SuccessGetCopyWith<$Res> {
  __$SuccessGetCopyWithImpl(this._self, this._then);

  final _SuccessGet _self;
  final $Res Function(_SuccessGet) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_SuccessGet(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SuccessSet implements CheckoutState {
  const _SuccessSet(this.message);

  final String message;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessSetCopyWith<_SuccessSet> get copyWith =>
      __$SuccessSetCopyWithImpl<_SuccessSet>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SuccessSet &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CheckoutState.successSet(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SuccessSetCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$SuccessSetCopyWith(
          _SuccessSet value, $Res Function(_SuccessSet) _then) =
      __$SuccessSetCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$SuccessSetCopyWithImpl<$Res> implements _$SuccessSetCopyWith<$Res> {
  __$SuccessSetCopyWithImpl(this._self, this._then);

  final _SuccessSet _self;
  final $Res Function(_SuccessSet) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_SuccessSet(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Failure implements CheckoutState {
  const _Failure(this.error);

  final String error;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'CheckoutState.failure(error: $error)';
  }
}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) =
      __$FailureCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$FailureCopyWithImpl<$Res> implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(_Failure(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _MakingPayment implements CheckoutState {
  const _MakingPayment();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _MakingPayment);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckoutState.makingPayment()';
  }
}

/// @nodoc

class _PaymentSuccess implements CheckoutState {
  const _PaymentSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PaymentSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckoutState.paymentSuccess()';
  }
}

/// @nodoc

class _PaymentFailure implements CheckoutState {
  const _PaymentFailure(this.error);

  final String error;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentFailureCopyWith<_PaymentFailure> get copyWith =>
      __$PaymentFailureCopyWithImpl<_PaymentFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'CheckoutState.paymentFailure(error: $error)';
  }
}

/// @nodoc
abstract mixin class _$PaymentFailureCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$PaymentFailureCopyWith(
          _PaymentFailure value, $Res Function(_PaymentFailure) _then) =
      __$PaymentFailureCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$PaymentFailureCopyWithImpl<$Res>
    implements _$PaymentFailureCopyWith<$Res> {
  __$PaymentFailureCopyWithImpl(this._self, this._then);

  final _PaymentFailure _self;
  final $Res Function(_PaymentFailure) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(_PaymentFailure(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
