// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CartState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartState<$T>()';
  }
}

/// @nodoc
class $CartStateCopyWith<T, $Res> {
  $CartStateCopyWith(CartState<T> _, $Res Function(CartState<T>) __);
}

/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns<T> on CartState<T> {
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
    TResult Function(CartLoading<T> value)? cartLoading,
    TResult Function(CartLoaded<T> value)? cartLoaded,
    TResult Function(CartError<T> value)? cartError,
    TResult Function(CartItemRemoving<T> value)? cartItemRemoving,
    TResult Function(CartItemRemoved<T> value)? cartItemRemoved,
    TResult Function(CartItemRemoveError<T> value)? cartItemRemoveError,
    TResult Function(CartQuantityIncreasing<T> value)? cartQuantityIncreasing,
    TResult Function(CartQuantityDecreasing<T> value)? cartQuantityDecreasing,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case CartLoading() when cartLoading != null:
        return cartLoading(_that);
      case CartLoaded() when cartLoaded != null:
        return cartLoaded(_that);
      case CartError() when cartError != null:
        return cartError(_that);
      case CartItemRemoving() when cartItemRemoving != null:
        return cartItemRemoving(_that);
      case CartItemRemoved() when cartItemRemoved != null:
        return cartItemRemoved(_that);
      case CartItemRemoveError() when cartItemRemoveError != null:
        return cartItemRemoveError(_that);
      case CartQuantityIncreasing() when cartQuantityIncreasing != null:
        return cartQuantityIncreasing(_that);
      case CartQuantityDecreasing() when cartQuantityDecreasing != null:
        return cartQuantityDecreasing(_that);
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
    required TResult Function(CartLoading<T> value) cartLoading,
    required TResult Function(CartLoaded<T> value) cartLoaded,
    required TResult Function(CartError<T> value) cartError,
    required TResult Function(CartItemRemoving<T> value) cartItemRemoving,
    required TResult Function(CartItemRemoved<T> value) cartItemRemoved,
    required TResult Function(CartItemRemoveError<T> value) cartItemRemoveError,
    required TResult Function(CartQuantityIncreasing<T> value)
        cartQuantityIncreasing,
    required TResult Function(CartQuantityDecreasing<T> value)
        cartQuantityDecreasing,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case CartLoading():
        return cartLoading(_that);
      case CartLoaded():
        return cartLoaded(_that);
      case CartError():
        return cartError(_that);
      case CartItemRemoving():
        return cartItemRemoving(_that);
      case CartItemRemoved():
        return cartItemRemoved(_that);
      case CartItemRemoveError():
        return cartItemRemoveError(_that);
      case CartQuantityIncreasing():
        return cartQuantityIncreasing(_that);
      case CartQuantityDecreasing():
        return cartQuantityDecreasing(_that);
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
    TResult? Function(CartLoading<T> value)? cartLoading,
    TResult? Function(CartLoaded<T> value)? cartLoaded,
    TResult? Function(CartError<T> value)? cartError,
    TResult? Function(CartItemRemoving<T> value)? cartItemRemoving,
    TResult? Function(CartItemRemoved<T> value)? cartItemRemoved,
    TResult? Function(CartItemRemoveError<T> value)? cartItemRemoveError,
    TResult? Function(CartQuantityIncreasing<T> value)? cartQuantityIncreasing,
    TResult? Function(CartQuantityDecreasing<T> value)? cartQuantityDecreasing,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case CartLoading() when cartLoading != null:
        return cartLoading(_that);
      case CartLoaded() when cartLoaded != null:
        return cartLoaded(_that);
      case CartError() when cartError != null:
        return cartError(_that);
      case CartItemRemoving() when cartItemRemoving != null:
        return cartItemRemoving(_that);
      case CartItemRemoved() when cartItemRemoved != null:
        return cartItemRemoved(_that);
      case CartItemRemoveError() when cartItemRemoveError != null:
        return cartItemRemoveError(_that);
      case CartQuantityIncreasing() when cartQuantityIncreasing != null:
        return cartQuantityIncreasing(_that);
      case CartQuantityDecreasing() when cartQuantityDecreasing != null:
        return cartQuantityDecreasing(_that);
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
    TResult Function()? cartLoading,
    TResult Function(List<ProductsModel> data)? cartLoaded,
    TResult Function(String message)? cartError,
    TResult Function()? cartItemRemoving,
    TResult Function(String message)? cartItemRemoved,
    TResult Function(String message)? cartItemRemoveError,
    TResult Function(int quantity)? cartQuantityIncreasing,
    TResult Function(int quantity)? cartQuantityDecreasing,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case CartLoading() when cartLoading != null:
        return cartLoading();
      case CartLoaded() when cartLoaded != null:
        return cartLoaded(_that.data);
      case CartError() when cartError != null:
        return cartError(_that.message);
      case CartItemRemoving() when cartItemRemoving != null:
        return cartItemRemoving();
      case CartItemRemoved() when cartItemRemoved != null:
        return cartItemRemoved(_that.message);
      case CartItemRemoveError() when cartItemRemoveError != null:
        return cartItemRemoveError(_that.message);
      case CartQuantityIncreasing() when cartQuantityIncreasing != null:
        return cartQuantityIncreasing(_that.quantity);
      case CartQuantityDecreasing() when cartQuantityDecreasing != null:
        return cartQuantityDecreasing(_that.quantity);
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
    required TResult Function() cartLoading,
    required TResult Function(List<ProductsModel> data) cartLoaded,
    required TResult Function(String message) cartError,
    required TResult Function() cartItemRemoving,
    required TResult Function(String message) cartItemRemoved,
    required TResult Function(String message) cartItemRemoveError,
    required TResult Function(int quantity) cartQuantityIncreasing,
    required TResult Function(int quantity) cartQuantityDecreasing,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case CartLoading():
        return cartLoading();
      case CartLoaded():
        return cartLoaded(_that.data);
      case CartError():
        return cartError(_that.message);
      case CartItemRemoving():
        return cartItemRemoving();
      case CartItemRemoved():
        return cartItemRemoved(_that.message);
      case CartItemRemoveError():
        return cartItemRemoveError(_that.message);
      case CartQuantityIncreasing():
        return cartQuantityIncreasing(_that.quantity);
      case CartQuantityDecreasing():
        return cartQuantityDecreasing(_that.quantity);
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
    TResult? Function()? cartLoading,
    TResult? Function(List<ProductsModel> data)? cartLoaded,
    TResult? Function(String message)? cartError,
    TResult? Function()? cartItemRemoving,
    TResult? Function(String message)? cartItemRemoved,
    TResult? Function(String message)? cartItemRemoveError,
    TResult? Function(int quantity)? cartQuantityIncreasing,
    TResult? Function(int quantity)? cartQuantityDecreasing,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case CartLoading() when cartLoading != null:
        return cartLoading();
      case CartLoaded() when cartLoaded != null:
        return cartLoaded(_that.data);
      case CartError() when cartError != null:
        return cartError(_that.message);
      case CartItemRemoving() when cartItemRemoving != null:
        return cartItemRemoving();
      case CartItemRemoved() when cartItemRemoved != null:
        return cartItemRemoved(_that.message);
      case CartItemRemoveError() when cartItemRemoveError != null:
        return cartItemRemoveError(_that.message);
      case CartQuantityIncreasing() when cartQuantityIncreasing != null:
        return cartQuantityIncreasing(_that.quantity);
      case CartQuantityDecreasing() when cartQuantityDecreasing != null:
        return cartQuantityDecreasing(_that.quantity);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> implements CartState<T> {
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
    return 'CartState<$T>.initial()';
  }
}

/// @nodoc

class CartLoading<T> implements CartState<T> {
  const CartLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CartLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartState<$T>.cartLoading()';
  }
}

/// @nodoc

class CartLoaded<T> implements CartState<T> {
  const CartLoaded(final List<ProductsModel> data) : _data = data;

  final List<ProductsModel> _data;
  List<ProductsModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartLoadedCopyWith<T, CartLoaded<T>> get copyWith =>
      _$CartLoadedCopyWithImpl<T, CartLoaded<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartLoaded<T> &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'CartState<$T>.cartLoaded(data: $data)';
  }
}

/// @nodoc
abstract mixin class $CartLoadedCopyWith<T, $Res>
    implements $CartStateCopyWith<T, $Res> {
  factory $CartLoadedCopyWith(
          CartLoaded<T> value, $Res Function(CartLoaded<T>) _then) =
      _$CartLoadedCopyWithImpl;
  @useResult
  $Res call({List<ProductsModel> data});
}

/// @nodoc
class _$CartLoadedCopyWithImpl<T, $Res>
    implements $CartLoadedCopyWith<T, $Res> {
  _$CartLoadedCopyWithImpl(this._self, this._then);

  final CartLoaded<T> _self;
  final $Res Function(CartLoaded<T>) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(CartLoaded<T>(
      null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProductsModel>,
    ));
  }
}

/// @nodoc

class CartError<T> implements CartState<T> {
  const CartError(this.message);

  final String message;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartErrorCopyWith<T, CartError<T>> get copyWith =>
      _$CartErrorCopyWithImpl<T, CartError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartError<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CartState<$T>.cartError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CartErrorCopyWith<T, $Res>
    implements $CartStateCopyWith<T, $Res> {
  factory $CartErrorCopyWith(
          CartError<T> value, $Res Function(CartError<T>) _then) =
      _$CartErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CartErrorCopyWithImpl<T, $Res> implements $CartErrorCopyWith<T, $Res> {
  _$CartErrorCopyWithImpl(this._self, this._then);

  final CartError<T> _self;
  final $Res Function(CartError<T>) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CartError<T>(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CartItemRemoving<T> implements CartState<T> {
  const CartItemRemoving();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CartItemRemoving<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CartState<$T>.cartItemRemoving()';
  }
}

/// @nodoc

class CartItemRemoved<T> implements CartState<T> {
  const CartItemRemoved(this.message);

  final String message;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartItemRemovedCopyWith<T, CartItemRemoved<T>> get copyWith =>
      _$CartItemRemovedCopyWithImpl<T, CartItemRemoved<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartItemRemoved<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CartState<$T>.cartItemRemoved(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CartItemRemovedCopyWith<T, $Res>
    implements $CartStateCopyWith<T, $Res> {
  factory $CartItemRemovedCopyWith(
          CartItemRemoved<T> value, $Res Function(CartItemRemoved<T>) _then) =
      _$CartItemRemovedCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CartItemRemovedCopyWithImpl<T, $Res>
    implements $CartItemRemovedCopyWith<T, $Res> {
  _$CartItemRemovedCopyWithImpl(this._self, this._then);

  final CartItemRemoved<T> _self;
  final $Res Function(CartItemRemoved<T>) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CartItemRemoved<T>(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CartItemRemoveError<T> implements CartState<T> {
  const CartItemRemoveError(this.message);

  final String message;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartItemRemoveErrorCopyWith<T, CartItemRemoveError<T>> get copyWith =>
      _$CartItemRemoveErrorCopyWithImpl<T, CartItemRemoveError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartItemRemoveError<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CartState<$T>.cartItemRemoveError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CartItemRemoveErrorCopyWith<T, $Res>
    implements $CartStateCopyWith<T, $Res> {
  factory $CartItemRemoveErrorCopyWith(CartItemRemoveError<T> value,
          $Res Function(CartItemRemoveError<T>) _then) =
      _$CartItemRemoveErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CartItemRemoveErrorCopyWithImpl<T, $Res>
    implements $CartItemRemoveErrorCopyWith<T, $Res> {
  _$CartItemRemoveErrorCopyWithImpl(this._self, this._then);

  final CartItemRemoveError<T> _self;
  final $Res Function(CartItemRemoveError<T>) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CartItemRemoveError<T>(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CartQuantityIncreasing<T> implements CartState<T> {
  const CartQuantityIncreasing(this.quantity);

  final int quantity;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartQuantityIncreasingCopyWith<T, CartQuantityIncreasing<T>> get copyWith =>
      _$CartQuantityIncreasingCopyWithImpl<T, CartQuantityIncreasing<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartQuantityIncreasing<T> &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quantity);

  @override
  String toString() {
    return 'CartState<$T>.cartQuantityIncreasing(quantity: $quantity)';
  }
}

/// @nodoc
abstract mixin class $CartQuantityIncreasingCopyWith<T, $Res>
    implements $CartStateCopyWith<T, $Res> {
  factory $CartQuantityIncreasingCopyWith(CartQuantityIncreasing<T> value,
          $Res Function(CartQuantityIncreasing<T>) _then) =
      _$CartQuantityIncreasingCopyWithImpl;
  @useResult
  $Res call({int quantity});
}

/// @nodoc
class _$CartQuantityIncreasingCopyWithImpl<T, $Res>
    implements $CartQuantityIncreasingCopyWith<T, $Res> {
  _$CartQuantityIncreasingCopyWithImpl(this._self, this._then);

  final CartQuantityIncreasing<T> _self;
  final $Res Function(CartQuantityIncreasing<T>) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? quantity = null,
  }) {
    return _then(CartQuantityIncreasing<T>(
      null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class CartQuantityDecreasing<T> implements CartState<T> {
  const CartQuantityDecreasing(this.quantity);

  final int quantity;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartQuantityDecreasingCopyWith<T, CartQuantityDecreasing<T>> get copyWith =>
      _$CartQuantityDecreasingCopyWithImpl<T, CartQuantityDecreasing<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartQuantityDecreasing<T> &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quantity);

  @override
  String toString() {
    return 'CartState<$T>.cartQuantityDecreasing(quantity: $quantity)';
  }
}

/// @nodoc
abstract mixin class $CartQuantityDecreasingCopyWith<T, $Res>
    implements $CartStateCopyWith<T, $Res> {
  factory $CartQuantityDecreasingCopyWith(CartQuantityDecreasing<T> value,
          $Res Function(CartQuantityDecreasing<T>) _then) =
      _$CartQuantityDecreasingCopyWithImpl;
  @useResult
  $Res call({int quantity});
}

/// @nodoc
class _$CartQuantityDecreasingCopyWithImpl<T, $Res>
    implements $CartQuantityDecreasingCopyWith<T, $Res> {
  _$CartQuantityDecreasingCopyWithImpl(this._self, this._then);

  final CartQuantityDecreasing<T> _self;
  final $Res Function(CartQuantityDecreasing<T>) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? quantity = null,
  }) {
    return _then(CartQuantityDecreasing<T>(
      null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
