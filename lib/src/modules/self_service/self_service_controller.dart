import 'package:asyncstate/asyncstate.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';

import 'package:signals_flutter/signals_flutter.dart';

import 'package:et_lab_clinica_self_service/src/models/patient_model.dart';
import 'package:et_lab_clinica_self_service/src/models/self_service_model.dart';

import '../../repositories/information_form/information_form_repository.dart';

enum FormSteps {
  none,
  whoIAm,
  findPatient,
  patient,
  documents,
  done,
  restart,
}

class SelfServiceController with MessageStateMixin {
  SelfServiceController({
    required this.informationRepository,
  });

  final InformationFormRepository informationRepository;

  final _step = ValueSignal(FormSteps.none);

  var _model = const SelfServiceModel();

  var password = '';

  SelfServiceModel get model => _model;

  FormSteps get step => _step();

  void startProcess() {
    _step.forceUpdate(FormSteps.whoIAm);
  }

  void setWhoIAmDataStepAndNext(String name, String lasName) {
    _model = _model.copyWith(
      name: () => name,
      lastName: () => lasName,
    );
    _step.forceUpdate(FormSteps.findPatient);
  }

  void clearForm() {
    _model = _model.clear();
  }

  void goToFormPatient(PatientModel? patient) {
    _model = _model.copyWith(
      patient: () => patient,
    );
    _step.forceUpdate(FormSteps.patient);
  }

  void restartProcess() {
    _step.forceUpdate(FormSteps.restart);
    clearForm();
  }

  void updatePatientAndGoDocument(PatientModel? patient) {
    _model = _model.copyWith(patient: () => patient);
    _step.forceUpdate(FormSteps.documents);
  }

  void registerDocument(DocumentType type, String filePath) {
    final documents = _model.documents ?? {};
    if (type == DocumentType.healthInsuranceCard) {
      documents[type]?.clear();
    }
    final values = documents[type] ?? [];
    values.add(filePath);
    documents[type] = values;
    _model = _model.copyWith(documents: () => documents);
  }

  void clearDocuments() {
    _model = _model.copyWith(documents: () => {});
  }

  Future<void> finalize() async {
    final result = await informationRepository.register(model).asyncLoader();
    switch (result) {
      case Left():
        showError('Erro ao registrar atendimento');
      case Right():
        password = '${_model.name}' '${_model.lastName}';
        _step.forceUpdate(FormSteps.done);
    }
  }
}
