import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';

abstract interface class UserRepository {
  Future<Either<AuthException, String>> login(String email, String password);
}
