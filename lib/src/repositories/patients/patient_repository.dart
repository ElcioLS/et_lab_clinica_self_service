import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';

import '../../models/patient_model.dart';

typedef RegisterPatientAddressModel = ({
  String cep,
  String streetAddress,
  String number,
  String addressComplement,
  String state,
  String city,
  String district,
});

typedef RegisterPatientModel = ({
  String name,
  String email,
  String phoneNumber,
  String document,
  RegisterPatientAddressModel address,
  String guardian,
  String guardianIdentificationNumber,
});

abstract interface class PatientRepository {
  Future<Either<RepositoryException, PatientModel?>> findPatientByDocument(
      String document);

  Future<Either<RepositoryException, Unit>> update(PatientModel patient);

  Future<Either<RepositoryException, PatientModel>> register(
      RegisterPatientModel patient);
}
