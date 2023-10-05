// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AsyncState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? result,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(ResultState<T> value) result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(ResultState<T> value)? result,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(ResultState<T> value)? result,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AsyncStateCopyWith<T, $Res> {
  factory $AsyncStateCopyWith(
          AsyncState<T> value, $Res Function(AsyncState<T>) then) =
      _$AsyncStateCopyWithImpl<T, $Res, AsyncState<T>>;
}

/// @nodoc
class _$AsyncStateCopyWithImpl<T, $Res, $Val extends AsyncState<T>>
    implements $AsyncStateCopyWith<T, $Res> {
  _$AsyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialStateImplCopyWith<T, $Res> {
  factory _$$InitialStateImplCopyWith(_$InitialStateImpl<T> value,
          $Res Function(_$InitialStateImpl<T>) then) =
      __$$InitialStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialStateImplCopyWithImpl<T, $Res>
    extends _$AsyncStateCopyWithImpl<T, $Res, _$InitialStateImpl<T>>
    implements _$$InitialStateImplCopyWith<T, $Res> {
  __$$InitialStateImplCopyWithImpl(
      _$InitialStateImpl<T> _value, $Res Function(_$InitialStateImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialStateImpl<T> implements InitialState<T> {
  const _$InitialStateImpl();

  @override
  String toString() {
    return 'AsyncState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) result,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? result,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? result,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(ResultState<T> value) result,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(ResultState<T> value)? result,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(ResultState<T> value)? result,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InitialState<T> implements AsyncState<T> {
  const factory InitialState() = _$InitialStateImpl<T>;
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<T, $Res> {
  factory _$$LoadingStateImplCopyWith(_$LoadingStateImpl<T> value,
          $Res Function(_$LoadingStateImpl<T>) then) =
      __$$LoadingStateImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<T, $Res>
    extends _$AsyncStateCopyWithImpl<T, $Res, _$LoadingStateImpl<T>>
    implements _$$LoadingStateImplCopyWith<T, $Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl<T> _value, $Res Function(_$LoadingStateImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingStateImpl<T> implements LoadingState<T> {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'AsyncState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) result,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? result,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? result,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(ResultState<T> value) result,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(ResultState<T> value)? result,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(ResultState<T> value)? result,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState<T> implements AsyncState<T> {
  const factory LoadingState() = _$LoadingStateImpl<T>;
}

/// @nodoc
abstract class _$$ResultStateImplCopyWith<T, $Res> {
  factory _$$ResultStateImplCopyWith(_$ResultStateImpl<T> value,
          $Res Function(_$ResultStateImpl<T>) then) =
      __$$ResultStateImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ResultStateImplCopyWithImpl<T, $Res>
    extends _$AsyncStateCopyWithImpl<T, $Res, _$ResultStateImpl<T>>
    implements _$$ResultStateImplCopyWith<T, $Res> {
  __$$ResultStateImplCopyWithImpl(
      _$ResultStateImpl<T> _value, $Res Function(_$ResultStateImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResultStateImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ResultStateImpl<T> implements ResultState<T> {
  const _$ResultStateImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'AsyncState<$T>.result(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultStateImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultStateImplCopyWith<T, _$ResultStateImpl<T>> get copyWith =>
      __$$ResultStateImplCopyWithImpl<T, _$ResultStateImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) result,
  }) {
    return result(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? result,
  }) {
    return result?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState<T> value) initial,
    required TResult Function(LoadingState<T> value) loading,
    required TResult Function(ResultState<T> value) result,
  }) {
    return result(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitialState<T> value)? initial,
    TResult? Function(LoadingState<T> value)? loading,
    TResult? Function(ResultState<T> value)? result,
  }) {
    return result?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState<T> value)? initial,
    TResult Function(LoadingState<T> value)? loading,
    TResult Function(ResultState<T> value)? result,
    required TResult orElse(),
  }) {
    if (result != null) {
      return result(this);
    }
    return orElse();
  }
}

abstract class ResultState<T> implements AsyncState<T> {
  const factory ResultState(final T data) = _$ResultStateImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$ResultStateImplCopyWith<T, _$ResultStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
