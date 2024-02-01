import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';

abstract interface class UserLoginService {
  Future<Either<ServiceException, Unit>> execute(String email, String password);
}
