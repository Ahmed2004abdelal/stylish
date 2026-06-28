// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState<$T>()';
  }
}

/// @nodoc
class $ProfileStateCopyWith<T, $Res> {
  $ProfileStateCopyWith(ProfileState<T> _, $Res Function(ProfileState<T>) __);
}

/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns<T> on ProfileState<T> {
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
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Saving<T> value)? saving,
    TResult Function(Saved<T> value)? saved,
    TResult Function(SavingError<T> value)? saveError,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case Saving() when saving != null:
        return saving(_that);
      case Saved() when saved != null:
        return saved(_that);
      case SavingError() when saveError != null:
        return saveError(_that);
      case Loading() when loading != null:
        return loading(_that);
      case Success() when success != null:
        return success(_that);
      case Failure() when failure != null:
        return failure(_that);
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Saving<T> value) saving,
    required TResult Function(Saved<T> value) saved,
    required TResult Function(SavingError<T> value) saveError,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Failure<T> value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case Saving():
        return saving(_that);
      case Saved():
        return saved(_that);
      case SavingError():
        return saveError(_that);
      case Loading():
        return loading(_that);
      case Success():
        return success(_that);
      case Failure():
        return failure(_that);
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
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Saving<T> value)? saving,
    TResult? Function(Saved<T> value)? saved,
    TResult? Function(SavingError<T> value)? saveError,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Failure<T> value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case Saving() when saving != null:
        return saving(_that);
      case Saved() when saved != null:
        return saved(_that);
      case SavingError() when saveError != null:
        return saveError(_that);
      case Loading() when loading != null:
        return loading(_that);
      case Success() when success != null:
        return success(_that);
      case Failure() when failure != null:
        return failure(_that);
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
    TResult Function()? saving,
    TResult Function(String message)? saved,
    TResult Function(String error)? saveError,
    TResult Function()? loading,
    TResult Function(List<PaymentModel> payments)? success,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case Saving() when saving != null:
        return saving();
      case Saved() when saved != null:
        return saved(_that.message);
      case SavingError() when saveError != null:
        return saveError(_that.error);
      case Loading() when loading != null:
        return loading();
      case Success() when success != null:
        return success(_that.payments);
      case Failure() when failure != null:
        return failure(_that.error);
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
    required TResult Function() saving,
    required TResult Function(String message) saved,
    required TResult Function(String error) saveError,
    required TResult Function() loading,
    required TResult Function(List<PaymentModel> payments) success,
    required TResult Function(String error) failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case Saving():
        return saving();
      case Saved():
        return saved(_that.message);
      case SavingError():
        return saveError(_that.error);
      case Loading():
        return loading();
      case Success():
        return success(_that.payments);
      case Failure():
        return failure(_that.error);
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
    TResult? Function()? saving,
    TResult? Function(String message)? saved,
    TResult? Function(String error)? saveError,
    TResult? Function()? loading,
    TResult? Function(List<PaymentModel> payments)? success,
    TResult? Function(String error)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case Saving() when saving != null:
        return saving();
      case Saved() when saved != null:
        return saved(_that.message);
      case SavingError() when saveError != null:
        return saveError(_that.error);
      case Loading() when loading != null:
        return loading();
      case Success() when success != null:
        return success(_that.payments);
      case Failure() when failure != null:
        return failure(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> implements ProfileState<T> {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState<$T>.initial()';
  }
}

/// @nodoc

class Saving<T> implements ProfileState<T> {
  const Saving();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Saving<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState<$T>.saving()';
  }
}

/// @nodoc

class Saved<T> implements ProfileState<T> {
  const Saved(this.message);

  final String message;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedCopyWith<T, Saved<T>> get copyWith =>
      _$SavedCopyWithImpl<T, Saved<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Saved<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ProfileState<$T>.saved(message: $message)';
  }
}

/// @nodoc
abstract mixin class $SavedCopyWith<T, $Res>
    implements $ProfileStateCopyWith<T, $Res> {
  factory $SavedCopyWith(Saved<T> value, $Res Function(Saved<T>) _then) =
      _$SavedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$SavedCopyWithImpl<T, $Res> implements $SavedCopyWith<T, $Res> {
  _$SavedCopyWithImpl(this._self, this._then);

  final Saved<T> _self;
  final $Res Function(Saved<T>) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(Saved<T>(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SavingError<T> implements ProfileState<T> {
  const SavingError(this.error);

  final String error;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavingErrorCopyWith<T, SavingError<T>> get copyWith =>
      _$SavingErrorCopyWithImpl<T, SavingError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavingError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'ProfileState<$T>.saveError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $SavingErrorCopyWith<T, $Res>
    implements $ProfileStateCopyWith<T, $Res> {
  factory $SavingErrorCopyWith(
          SavingError<T> value, $Res Function(SavingError<T>) _then) =
      _$SavingErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$SavingErrorCopyWithImpl<T, $Res>
    implements $SavingErrorCopyWith<T, $Res> {
  _$SavingErrorCopyWithImpl(this._self, this._then);

  final SavingError<T> _self;
  final $Res Function(SavingError<T>) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(SavingError<T>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class Loading<T> implements ProfileState<T> {
  const Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState<$T>.loading()';
  }
}

/// @nodoc

class Success<T> implements ProfileState<T> {
  const Success(final List<PaymentModel> payments) : _payments = payments;

  final List<PaymentModel> _payments;
  List<PaymentModel> get payments {
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<T, Success<T>> get copyWith =>
      _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success<T> &&
            const DeepCollectionEquality().equals(other._payments, _payments));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_payments));

  @override
  String toString() {
    return 'ProfileState<$T>.success(payments: $payments)';
  }
}

/// @nodoc
abstract mixin class $SuccessCopyWith<T, $Res>
    implements $ProfileStateCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) _then) =
      _$SuccessCopyWithImpl;
  @useResult
  $Res call({List<PaymentModel> payments});
}

/// @nodoc
class _$SuccessCopyWithImpl<T, $Res> implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<T> _self;
  final $Res Function(Success<T>) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? payments = null,
  }) {
    return _then(Success<T>(
      null == payments
          ? _self._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>,
    ));
  }
}

/// @nodoc

class Failure<T> implements ProfileState<T> {
  const Failure(this.error);

  final String error;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailureCopyWith<T, Failure<T>> get copyWith =>
      _$FailureCopyWithImpl<T, Failure<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failure<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'ProfileState<$T>.failure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $FailureCopyWith<T, $Res>
    implements $ProfileStateCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) _then) =
      _$FailureCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$FailureCopyWithImpl<T, $Res> implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure<T> _self;
  final $Res Function(Failure<T>) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(Failure<T>(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
