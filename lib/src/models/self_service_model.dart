import 'package:flutter/material.dart';

import 'package:et_lab_clinica_self_service/src/models/patient_model.dart';

final class SelfServiceModel {
  const SelfServiceModel({this.name, this.lastName, this.patient});

  final String? name;
  final String? lastName;
  final PatientModel? patient;

  SelfServiceModel clear() {
    return copyWith(
      name: () => null,
      lastName: () => null,
      patient: () => null,
    );
  }

  SelfServiceModel copyWith({
    ValueGetter<String?>? name,
    ValueGetter<String?>? lastName,
    ValueGetter<PatientModel?>? patient,
  }) {
    return SelfServiceModel(
      name: name != null ? name() : this.name,
      lastName: lastName != null ? lastName() : this.lastName,
      patient: patient != null ? patient() : this.patient,
    );
  }
}
