import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:et_lab_clinica_self_service/src/models/self_service_model.dart';

abstract interface class InformationFormRepository {
  Future<Either<RepositoryException, Unit>> register(SelfServiceModel model);
}
