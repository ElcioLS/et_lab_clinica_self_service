import 'dart:async';
import 'dart:developer';

import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:et_lab_clinica_self_service/src/binding/lab_clinica_application_binding.dart';
import 'package:et_lab_clinica_self_service/src/modules/auth/auth_module.dart';
import 'package:et_lab_clinica_self_service/src/modules/home/home_module.dart';
import 'package:et_lab_clinica_self_service/src/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runZonedGuarded(() {
    runApp(const LabClinicaSelfServiceApp());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class LabClinicaSelfServiceApp extends StatelessWidget {
  const LabClinicaSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicaCoreConfig(
      title: 'Lab Clinica Auto Atendimento',
      binding: LabClinicaApplicationBinding(),
      pagesBuilders: [
        FlutterGetItPageBuilder(
          page: (_) => const SplashPage(),
          path: '/',
        )
      ],
      modules: [
        AuthModule(),
        HomeModule(),
      ],
    );
  }
}
