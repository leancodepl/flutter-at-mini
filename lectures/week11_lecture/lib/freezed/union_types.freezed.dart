// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'union_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IpAddr {
  int get a => throw _privateConstructorUsedError;
  int get b => throw _privateConstructorUsedError;
  int get c => throw _privateConstructorUsedError;
  int get d => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int a, int b, int c, int d) v4,
    required TResult Function(
            int a, int b, int c, int d, int e, int f, int g, int h)
        v6,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int a, int b, int c, int d)? v4,
    TResult? Function(int a, int b, int c, int d, int e, int f, int g, int h)?
        v6,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int a, int b, int c, int d)? v4,
    TResult Function(int a, int b, int c, int d, int e, int f, int g, int h)?
        v6,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IpAddrV4 value) v4,
    required TResult Function(IpAddrV6 value) v6,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IpAddrV4 value)? v4,
    TResult? Function(IpAddrV6 value)? v6,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IpAddrV4 value)? v4,
    TResult Function(IpAddrV6 value)? v6,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IpAddrCopyWith<IpAddr> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IpAddrCopyWith<$Res> {
  factory $IpAddrCopyWith(IpAddr value, $Res Function(IpAddr) then) =
      _$IpAddrCopyWithImpl<$Res, IpAddr>;
  @useResult
  $Res call({int a, int b, int c, int d});
}

/// @nodoc
class _$IpAddrCopyWithImpl<$Res, $Val extends IpAddr>
    implements $IpAddrCopyWith<$Res> {
  _$IpAddrCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? b = null,
    Object? c = null,
    Object? d = null,
  }) {
    return _then(_value.copyWith(
      a: null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      b: null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
      c: null == c
          ? _value.c
          : c // ignore: cast_nullable_to_non_nullable
              as int,
      d: null == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IpAddrV4ImplCopyWith<$Res> implements $IpAddrCopyWith<$Res> {
  factory _$$IpAddrV4ImplCopyWith(
          _$IpAddrV4Impl value, $Res Function(_$IpAddrV4Impl) then) =
      __$$IpAddrV4ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int a, int b, int c, int d});
}

/// @nodoc
class __$$IpAddrV4ImplCopyWithImpl<$Res>
    extends _$IpAddrCopyWithImpl<$Res, _$IpAddrV4Impl>
    implements _$$IpAddrV4ImplCopyWith<$Res> {
  __$$IpAddrV4ImplCopyWithImpl(
      _$IpAddrV4Impl _value, $Res Function(_$IpAddrV4Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? b = null,
    Object? c = null,
    Object? d = null,
  }) {
    return _then(_$IpAddrV4Impl(
      null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
      null == c
          ? _value.c
          : c // ignore: cast_nullable_to_non_nullable
              as int,
      null == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IpAddrV4Impl extends IpAddrV4 {
  const _$IpAddrV4Impl(this.a, this.b, this.c, this.d) : super._();

  @override
  final int a;
  @override
  final int b;
  @override
  final int c;
  @override
  final int d;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IpAddrV4Impl &&
            (identical(other.a, a) || other.a == a) &&
            (identical(other.b, b) || other.b == b) &&
            (identical(other.c, c) || other.c == c) &&
            (identical(other.d, d) || other.d == d));
  }

  @override
  int get hashCode => Object.hash(runtimeType, a, b, c, d);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IpAddrV4ImplCopyWith<_$IpAddrV4Impl> get copyWith =>
      __$$IpAddrV4ImplCopyWithImpl<_$IpAddrV4Impl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int a, int b, int c, int d) v4,
    required TResult Function(
            int a, int b, int c, int d, int e, int f, int g, int h)
        v6,
  }) {
    return v4(a, b, c, d);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int a, int b, int c, int d)? v4,
    TResult? Function(int a, int b, int c, int d, int e, int f, int g, int h)?
        v6,
  }) {
    return v4?.call(a, b, c, d);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int a, int b, int c, int d)? v4,
    TResult Function(int a, int b, int c, int d, int e, int f, int g, int h)?
        v6,
    required TResult orElse(),
  }) {
    if (v4 != null) {
      return v4(a, b, c, d);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IpAddrV4 value) v4,
    required TResult Function(IpAddrV6 value) v6,
  }) {
    return v4(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IpAddrV4 value)? v4,
    TResult? Function(IpAddrV6 value)? v6,
  }) {
    return v4?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IpAddrV4 value)? v4,
    TResult Function(IpAddrV6 value)? v6,
    required TResult orElse(),
  }) {
    if (v4 != null) {
      return v4(this);
    }
    return orElse();
  }
}

abstract class IpAddrV4 extends IpAddr {
  const factory IpAddrV4(final int a, final int b, final int c, final int d) =
      _$IpAddrV4Impl;
  const IpAddrV4._() : super._();

  @override
  int get a;
  @override
  int get b;
  @override
  int get c;
  @override
  int get d;
  @override
  @JsonKey(ignore: true)
  _$$IpAddrV4ImplCopyWith<_$IpAddrV4Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IpAddrV6ImplCopyWith<$Res> implements $IpAddrCopyWith<$Res> {
  factory _$$IpAddrV6ImplCopyWith(
          _$IpAddrV6Impl value, $Res Function(_$IpAddrV6Impl) then) =
      __$$IpAddrV6ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int a, int b, int c, int d, int e, int f, int g, int h});
}

/// @nodoc
class __$$IpAddrV6ImplCopyWithImpl<$Res>
    extends _$IpAddrCopyWithImpl<$Res, _$IpAddrV6Impl>
    implements _$$IpAddrV6ImplCopyWith<$Res> {
  __$$IpAddrV6ImplCopyWithImpl(
      _$IpAddrV6Impl _value, $Res Function(_$IpAddrV6Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? a = null,
    Object? b = null,
    Object? c = null,
    Object? d = null,
    Object? e = null,
    Object? f = null,
    Object? g = null,
    Object? h = null,
  }) {
    return _then(_$IpAddrV6Impl(
      null == a
          ? _value.a
          : a // ignore: cast_nullable_to_non_nullable
              as int,
      null == b
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
      null == c
          ? _value.c
          : c // ignore: cast_nullable_to_non_nullable
              as int,
      null == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as int,
      null == e
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as int,
      null == f
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as int,
      null == g
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as int,
      null == h
          ? _value.h
          : h // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IpAddrV6Impl extends IpAddrV6 {
  const _$IpAddrV6Impl(
      this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h)
      : super._();

  @override
  final int a;
  @override
  final int b;
  @override
  final int c;
  @override
  final int d;
  @override
  final int e;
  @override
  final int f;
  @override
  final int g;
  @override
  final int h;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IpAddrV6Impl &&
            (identical(other.a, a) || other.a == a) &&
            (identical(other.b, b) || other.b == b) &&
            (identical(other.c, c) || other.c == c) &&
            (identical(other.d, d) || other.d == d) &&
            (identical(other.e, e) || other.e == e) &&
            (identical(other.f, f) || other.f == f) &&
            (identical(other.g, g) || other.g == g) &&
            (identical(other.h, h) || other.h == h));
  }

  @override
  int get hashCode => Object.hash(runtimeType, a, b, c, d, e, f, g, h);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IpAddrV6ImplCopyWith<_$IpAddrV6Impl> get copyWith =>
      __$$IpAddrV6ImplCopyWithImpl<_$IpAddrV6Impl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int a, int b, int c, int d) v4,
    required TResult Function(
            int a, int b, int c, int d, int e, int f, int g, int h)
        v6,
  }) {
    return v6(a, b, c, d, e, f, g, h);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int a, int b, int c, int d)? v4,
    TResult? Function(int a, int b, int c, int d, int e, int f, int g, int h)?
        v6,
  }) {
    return v6?.call(a, b, c, d, e, f, g, h);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int a, int b, int c, int d)? v4,
    TResult Function(int a, int b, int c, int d, int e, int f, int g, int h)?
        v6,
    required TResult orElse(),
  }) {
    if (v6 != null) {
      return v6(a, b, c, d, e, f, g, h);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IpAddrV4 value) v4,
    required TResult Function(IpAddrV6 value) v6,
  }) {
    return v6(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IpAddrV4 value)? v4,
    TResult? Function(IpAddrV6 value)? v6,
  }) {
    return v6?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IpAddrV4 value)? v4,
    TResult Function(IpAddrV6 value)? v6,
    required TResult orElse(),
  }) {
    if (v6 != null) {
      return v6(this);
    }
    return orElse();
  }
}

abstract class IpAddrV6 extends IpAddr {
  const factory IpAddrV6(final int a, final int b, final int c, final int d,
      final int e, final int f, final int g, final int h) = _$IpAddrV6Impl;
  const IpAddrV6._() : super._();

  @override
  int get a;
  @override
  int get b;
  @override
  int get c;
  @override
  int get d;
  int get e;
  int get f;
  int get g;
  int get h;
  @override
  @JsonKey(ignore: true)
  _$$IpAddrV6ImplCopyWith<_$IpAddrV6Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
