import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';

import '../../models/patient_model.dart';

abstract interface class PatientRepository {
  Future<Either<RepositoryException, PatientModel?>> findPatientByDocument(
      String document);
}
