import 'dart:typed_data';

import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';

abstract interface class DocumentsRepository {
  Future<Either<RepositoryException, String>> uploadImage(
      Uint8List file, String fileName);
}
