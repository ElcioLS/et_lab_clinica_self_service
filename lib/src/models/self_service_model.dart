import 'package:flutter/material.dart';

final class SelfServiceModel {
  const SelfServiceModel({
    this.name,
    this.lastName,
  });

  final String? name;
  final String? lastName;

  SelfServiceModel clear() {
    return copyWith(name: () => null, lastName: () => null);
  }

  SelfServiceModel copyWith({
    ValueGetter<String?>? name,
    ValueGetter<String?>? lastName,
  }) {
    return SelfServiceModel(
      name: name != null ? name() : this.name,
      lastName: lastName != null ? lastName() : this.lastName,
    );
  }
}
