import 'package:et_lab_clinica_self_service/src/modules/self_service/find_patient/find_patient_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class FindPatientRouter extends FlutterGetItModulePageRouter {
  @override
  WidgetBuilder get view => (_) => const FindPatientPage();
}
