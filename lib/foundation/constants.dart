import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Flavor {
  staging,
  production,
}

@immutable
class Constants {
  const Constants._({
    required this.endpoint,
  });

  final String endpoint;

  factory Constants.of() {
    final flavor = EnumToString.fromString(
      Flavor.values,
      const String.fromEnvironment('FLAVOR'),
    );

    switch (flavor) {
      case Flavor.staging:
        return Constants._staging();
      case Flavor.production:
        return Constants._production();
      default:
        assert(false, 'No flavor is specified.');
        return Constants._staging();
    }
  }

  factory Constants._staging() {
    return const Constants._(
      endpoint: 'https://api.github.com',
    );
  }

  factory Constants._production() {
    return const Constants._(
      endpoint: 'https://api.github.com',
    );
  }
}
