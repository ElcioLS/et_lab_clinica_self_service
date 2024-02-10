import 'dart:typed_data';

import 'package:asyncstate/asyncstate.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../../repositories/documents/documents_repository.dart';

class DocumentsScanConfirmController with MessageStateMixin {
  DocumentsScanConfirmController({
    required this.documentsRepository,
  });

  final pathRemoteStorage = signal<String?>(null);
  final DocumentsRepository documentsRepository;

  Future<void> uploadImage(Uint8List imageBytes, String fileName) async {
    final result = await documentsRepository
        .uploadImage(imageBytes, fileName)
        .asyncLoader();

    switch (result) {
      case Left():
        showError('Erro ao fazer o upload da imagem');
      case Right(value: final pathFile):
        pathRemoteStorage.value = pathFile;
    }
  }
}
