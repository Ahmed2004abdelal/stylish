// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState<$T>()';
  }
}

/// @nodoc
class $HomeStateCopyWith<T, $Res> {
  $HomeStateCopyWith(HomeState<T> _, $Res Function(HomeState<T>) __);
}

/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns<T> on HomeState<T> {
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
    TResult Function(HomeCategoryLoading<T> value)? homeCategoryLoading,
    TResult Function(HomeCategorySuccess<T> value)? homeCategorySuccess,
    TResult Function(HomeCategoryError<T> value)? homeCategoryError,
    TResult Function(HomeProductLoading<T> value)? homeProductLoading,
    TResult Function(HomeProductSuccess<T> value)? homeProductSuccess,
    TResult Function(HomeProductError<T> value)? homeProductError,
    TResult Function(AddToCartLoading<T> value)? addToCartLoading,
    TResult Function(AddToCartSuccess<T> value)? addToCartSuccess,
    TResult Function(AddToCartError<T> value)? addToCartError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case HomeCategoryLoading() when homeCategoryLoading != null:
        return homeCategoryLoading(_that);
      case HomeCategorySuccess() when homeCategorySuccess != null:
        return homeCategorySuccess(_that);
      case HomeCategoryError() when homeCategoryError != null:
        return homeCategoryError(_that);
      case HomeProductLoading() when homeProductLoading != null:
        return homeProductLoading(_that);
      case HomeProductSuccess() when homeProductSuccess != null:
        return homeProductSuccess(_that);
      case HomeProductError() when homeProductError != null:
        return homeProductError(_that);
      case AddToCartLoading() when addToCartLoading != null:
        return addToCartLoading(_that);
      case AddToCartSuccess() when addToCartSuccess != null:
        return addToCartSuccess(_that);
      case AddToCartError() when addToCartError != null:
        return addToCartError(_that);
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
    required TResult Function(HomeCategoryLoading<T> value) homeCategoryLoading,
    required TResult Function(HomeCategorySuccess<T> value) homeCategorySuccess,
    required TResult Function(HomeCategoryError<T> value) homeCategoryError,
    required TResult Function(HomeProductLoading<T> value) homeProductLoading,
    required TResult Function(HomeProductSuccess<T> value) homeProductSuccess,
    required TResult Function(HomeProductError<T> value) homeProductError,
    required TResult Function(AddToCartLoading<T> value) addToCartLoading,
    required TResult Function(AddToCartSuccess<T> value) addToCartSuccess,
    required TResult Function(AddToCartError<T> value) addToCartError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case HomeCategoryLoading():
        return homeCategoryLoading(_that);
      case HomeCategorySuccess():
        return homeCategorySuccess(_that);
      case HomeCategoryError():
        return homeCategoryError(_that);
      case HomeProductLoading():
        return homeProductLoading(_that);
      case HomeProductSuccess():
        return homeProductSuccess(_that);
      case HomeProductError():
        return homeProductError(_that);
      case AddToCartLoading():
        return addToCartLoading(_that);
      case AddToCartSuccess():
        return addToCartSuccess(_that);
      case AddToCartError():
        return addToCartError(_that);
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
    TResult? Function(HomeCategoryLoading<T> value)? homeCategoryLoading,
    TResult? Function(HomeCategorySuccess<T> value)? homeCategorySuccess,
    TResult? Function(HomeCategoryError<T> value)? homeCategoryError,
    TResult? Function(HomeProductLoading<T> value)? homeProductLoading,
    TResult? Function(HomeProductSuccess<T> value)? homeProductSuccess,
    TResult? Function(HomeProductError<T> value)? homeProductError,
    TResult? Function(AddToCartLoading<T> value)? addToCartLoading,
    TResult? Function(AddToCartSuccess<T> value)? addToCartSuccess,
    TResult? Function(AddToCartError<T> value)? addToCartError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case HomeCategoryLoading() when homeCategoryLoading != null:
        return homeCategoryLoading(_that);
      case HomeCategorySuccess() when homeCategorySuccess != null:
        return homeCategorySuccess(_that);
      case HomeCategoryError() when homeCategoryError != null:
        return homeCategoryError(_that);
      case HomeProductLoading() when homeProductLoading != null:
        return homeProductLoading(_that);
      case HomeProductSuccess() when homeProductSuccess != null:
        return homeProductSuccess(_that);
      case HomeProductError() when homeProductError != null:
        return homeProductError(_that);
      case AddToCartLoading() when addToCartLoading != null:
        return addToCartLoading(_that);
      case AddToCartSuccess() when addToCartSuccess != null:
        return addToCartSuccess(_that);
      case AddToCartError() when addToCartError != null:
        return addToCartError(_that);
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
    TResult Function()? homeCategoryLoading,
    TResult Function(T data)? homeCategorySuccess,
    TResult Function(String message)? homeCategoryError,
    TResult Function()? homeProductLoading,
    TResult Function(Stream<List<ProductsModel>> data)? homeProductSuccess,
    TResult Function(String message)? homeProductError,
    TResult Function()? addToCartLoading,
    TResult Function(String message)? addToCartSuccess,
    TResult Function(String message)? addToCartError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case HomeCategoryLoading() when homeCategoryLoading != null:
        return homeCategoryLoading();
      case HomeCategorySuccess() when homeCategorySuccess != null:
        return homeCategorySuccess(_that.data);
      case HomeCategoryError() when homeCategoryError != null:
        return homeCategoryError(_that.message);
      case HomeProductLoading() when homeProductLoading != null:
        return homeProductLoading();
      case HomeProductSuccess() when homeProductSuccess != null:
        return homeProductSuccess(_that.data);
      case HomeProductError() when homeProductError != null:
        return homeProductError(_that.message);
      case AddToCartLoading() when addToCartLoading != null:
        return addToCartLoading();
      case AddToCartSuccess() when addToCartSuccess != null:
        return addToCartSuccess(_that.message);
      case AddToCartError() when addToCartError != null:
        return addToCartError(_that.message);
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
    required TResult Function() homeCategoryLoading,
    required TResult Function(T data) homeCategorySuccess,
    required TResult Function(String message) homeCategoryError,
    required TResult Function() homeProductLoading,
    required TResult Function(Stream<List<ProductsModel>> data)
        homeProductSuccess,
    required TResult Function(String message) homeProductError,
    required TResult Function() addToCartLoading,
    required TResult Function(String message) addToCartSuccess,
    required TResult Function(String message) addToCartError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case HomeCategoryLoading():
        return homeCategoryLoading();
      case HomeCategorySuccess():
        return homeCategorySuccess(_that.data);
      case HomeCategoryError():
        return homeCategoryError(_that.message);
      case HomeProductLoading():
        return homeProductLoading();
      case HomeProductSuccess():
        return homeProductSuccess(_that.data);
      case HomeProductError():
        return homeProductError(_that.message);
      case AddToCartLoading():
        return addToCartLoading();
      case AddToCartSuccess():
        return addToCartSuccess(_that.message);
      case AddToCartError():
        return addToCartError(_that.message);
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
    TResult? Function()? homeCategoryLoading,
    TResult? Function(T data)? homeCategorySuccess,
    TResult? Function(String message)? homeCategoryError,
    TResult? Function()? homeProductLoading,
    TResult? Function(Stream<List<ProductsModel>> data)? homeProductSuccess,
    TResult? Function(String message)? homeProductError,
    TResult? Function()? addToCartLoading,
    TResult? Function(String message)? addToCartSuccess,
    TResult? Function(String message)? addToCartError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case HomeCategoryLoading() when homeCategoryLoading != null:
        return homeCategoryLoading();
      case HomeCategorySuccess() when homeCategorySuccess != null:
        return homeCategorySuccess(_that.data);
      case HomeCategoryError() when homeCategoryError != null:
        return homeCategoryError(_that.message);
      case HomeProductLoading() when homeProductLoading != null:
        return homeProductLoading();
      case HomeProductSuccess() when homeProductSuccess != null:
        return homeProductSuccess(_that.data);
      case HomeProductError() when homeProductError != null:
        return homeProductError(_that.message);
      case AddToCartLoading() when addToCartLoading != null:
        return addToCartLoading();
      case AddToCartSuccess() when addToCartSuccess != null:
        return addToCartSuccess(_that.message);
      case AddToCartError() when addToCartError != null:
        return addToCartError(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> implements HomeState<T> {
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
    return 'HomeState<$T>.initial()';
  }
}

/// @nodoc

class HomeCategoryLoading<T> implements HomeState<T> {
  const HomeCategoryLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeCategoryLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState<$T>.homeCategoryLoading()';
  }
}

/// @nodoc

class HomeCategorySuccess<T> implements HomeState<T> {
  const HomeCategorySuccess(this.data);

  final T data;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeCategorySuccessCopyWith<T, HomeCategorySuccess<T>> get copyWith =>
      _$HomeCategorySuccessCopyWithImpl<T, HomeCategorySuccess<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeCategorySuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'HomeState<$T>.homeCategorySuccess(data: $data)';
  }
}

/// @nodoc
abstract mixin class $HomeCategorySuccessCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $HomeCategorySuccessCopyWith(HomeCategorySuccess<T> value,
          $Res Function(HomeCategorySuccess<T>) _then) =
      _$HomeCategorySuccessCopyWithImpl;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$HomeCategorySuccessCopyWithImpl<T, $Res>
    implements $HomeCategorySuccessCopyWith<T, $Res> {
  _$HomeCategorySuccessCopyWithImpl(this._self, this._then);

  final HomeCategorySuccess<T> _self;
  final $Res Function(HomeCategorySuccess<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(HomeCategorySuccess<T>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class HomeCategoryError<T> implements HomeState<T> {
  const HomeCategoryError(this.message);

  final String message;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeCategoryErrorCopyWith<T, HomeCategoryError<T>> get copyWith =>
      _$HomeCategoryErrorCopyWithImpl<T, HomeCategoryError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeCategoryError<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'HomeState<$T>.homeCategoryError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $HomeCategoryErrorCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $HomeCategoryErrorCopyWith(HomeCategoryError<T> value,
          $Res Function(HomeCategoryError<T>) _then) =
      _$HomeCategoryErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$HomeCategoryErrorCopyWithImpl<T, $Res>
    implements $HomeCategoryErrorCopyWith<T, $Res> {
  _$HomeCategoryErrorCopyWithImpl(this._self, this._then);

  final HomeCategoryError<T> _self;
  final $Res Function(HomeCategoryError<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(HomeCategoryError<T>(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class HomeProductLoading<T> implements HomeState<T> {
  const HomeProductLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeProductLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState<$T>.homeProductLoading()';
  }
}

/// @nodoc

class HomeProductSuccess<T> implements HomeState<T> {
  const HomeProductSuccess(this.data);

  final Stream<List<ProductsModel>> data;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeProductSuccessCopyWith<T, HomeProductSuccess<T>> get copyWith =>
      _$HomeProductSuccessCopyWithImpl<T, HomeProductSuccess<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeProductSuccess<T> &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'HomeState<$T>.homeProductSuccess(data: $data)';
  }
}

/// @nodoc
abstract mixin class $HomeProductSuccessCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $HomeProductSuccessCopyWith(HomeProductSuccess<T> value,
          $Res Function(HomeProductSuccess<T>) _then) =
      _$HomeProductSuccessCopyWithImpl;
  @useResult
  $Res call({Stream<List<ProductsModel>> data});
}

/// @nodoc
class _$HomeProductSuccessCopyWithImpl<T, $Res>
    implements $HomeProductSuccessCopyWith<T, $Res> {
  _$HomeProductSuccessCopyWithImpl(this._self, this._then);

  final HomeProductSuccess<T> _self;
  final $Res Function(HomeProductSuccess<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(HomeProductSuccess<T>(
      null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Stream<List<ProductsModel>>,
    ));
  }
}

/// @nodoc

class HomeProductError<T> implements HomeState<T> {
  const HomeProductError(this.message);

  final String message;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeProductErrorCopyWith<T, HomeProductError<T>> get copyWith =>
      _$HomeProductErrorCopyWithImpl<T, HomeProductError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeProductError<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'HomeState<$T>.homeProductError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $HomeProductErrorCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $HomeProductErrorCopyWith(
          HomeProductError<T> value, $Res Function(HomeProductError<T>) _then) =
      _$HomeProductErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$HomeProductErrorCopyWithImpl<T, $Res>
    implements $HomeProductErrorCopyWith<T, $Res> {
  _$HomeProductErrorCopyWithImpl(this._self, this._then);

  final HomeProductError<T> _self;
  final $Res Function(HomeProductError<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(HomeProductError<T>(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AddToCartLoading<T> implements HomeState<T> {
  const AddToCartLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddToCartLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState<$T>.addToCartLoading()';
  }
}

/// @nodoc

class AddToCartSuccess<T> implements HomeState<T> {
  const AddToCartSuccess(this.message);

  final String message;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddToCartSuccessCopyWith<T, AddToCartSuccess<T>> get copyWith =>
      _$AddToCartSuccessCopyWithImpl<T, AddToCartSuccess<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddToCartSuccess<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'HomeState<$T>.addToCartSuccess(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AddToCartSuccessCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $AddToCartSuccessCopyWith(
          AddToCartSuccess<T> value, $Res Function(AddToCartSuccess<T>) _then) =
      _$AddToCartSuccessCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AddToCartSuccessCopyWithImpl<T, $Res>
    implements $AddToCartSuccessCopyWith<T, $Res> {
  _$AddToCartSuccessCopyWithImpl(this._self, this._then);

  final AddToCartSuccess<T> _self;
  final $Res Function(AddToCartSuccess<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AddToCartSuccess<T>(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AddToCartError<T> implements HomeState<T> {
  const AddToCartError(this.message);

  final String message;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddToCartErrorCopyWith<T, AddToCartError<T>> get copyWith =>
      _$AddToCartErrorCopyWithImpl<T, AddToCartError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddToCartError<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'HomeState<$T>.addToCartError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AddToCartErrorCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $AddToCartErrorCopyWith(
          AddToCartError<T> value, $Res Function(AddToCartError<T>) _then) =
      _$AddToCartErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AddToCartErrorCopyWithImpl<T, $Res>
    implements $AddToCartErrorCopyWith<T, $Res> {
  _$AddToCartErrorCopyWithImpl(this._self, this._then);

  final AddToCartError<T> _self;
  final $Res Function(AddToCartError<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AddToCartError<T>(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
