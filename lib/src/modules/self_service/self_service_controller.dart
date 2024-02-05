import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:et_lab_clinica_self_service/src/models/self_service_model.dart';
import 'package:signals_flutter/signals_flutter.dart';

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
  final _step = ValueSignal(FormSteps.none);

  var _model = const SelfServiceModel();

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
}
