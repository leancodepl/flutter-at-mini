import 'package:freezed_annotation/freezed_annotation.dart';

part 'union_types.freezed.dart';

@freezed
class IpAddr with _$IpAddr {
  const factory IpAddr.v4(int a, int b, int c, int d) = IpAddrV4;
  const factory IpAddr.v6(
    int a,
    int b,
    int c,
    int d,
    int e,
    int f,
    int g,
    int h,
  ) = IpAddrV6; // you can give custom names for type variants

  // needed if you want to add your own methods
  const IpAddr._();

  @override
  String toString() => map(
        v4: (addr) => [addr.a, addr.b, addr.c, addr.d].join('.'),
        v6: (addr) => [
          addr.a,
          addr.b,
          addr.c,
          addr.d,
          addr.e,
          addr.f,
          addr.g,
          addr.h,
        ].map((part) => part.toRadixString(16)).join(':'),
      );
}

void main() {
  print(const IpAddr.v4(127, 0, 0, 1));
  print(const IpAddr.v6(0, 0, 0, 0, 0, 0, 0, 1));

  const addr = IpAddr.v4(192, 168, 0, 1);

  // you can switch over possible variants with `map`
  final firstPart = addr.map(v4: (addr) => addr.a, v6: (addr) => addr.a);

  // `when` is like `map` but fields are inlined
  final lastPart = addr.when(
    v4: (a, b, c, d) => d,
    v6: (a, b, c, d, e, f, g, h) => h,
  );

  // if all variants share a field (same name and type) then you can access it directly
  final secondPart = addr.b;

  // if you do not want an exhaustive switch use `maybe*` and `*OrNull` methods
  final v4ThirdOctet = addr.maybeMap(
    // if variants fail to match, result of `orElse` is returned
    v4: (addr) => addr.c,
    orElse: () => throw StateError('expected the v4 variant'),
  );
  final v6FifthSegment = addr.mapOrNull(
    // if variants fail to match, null is returned. Equivalent to adding `orElse: () => null` in `maybe*`
    v6: (addr) => addr.e,
  );

  // you can also directly check types
  if (addr is IpAddrV4) {
    // `addr` variable was promoted to a `IpAddrV4`
    print('Address is in IPv4!');
  }
}
