import 'dart:async';
import 'dart:developer';

import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:et_lab_clinica_self_service/src/binding/lab_clinica_application_binding.dart';
import 'package:et_lab_clinica_self_service/src/modules/auth/auth_module.dart';
import 'package:et_lab_clinica_self_service/src/modules/home/home_module.dart';
import 'package:et_lab_clinica_self_service/src/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:camera/camera.dart';
import 'src/modules/self_service/self_service_module.dart';

late List<CameraDescription> _cameras;

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    _cameras = await availableCameras();

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
        SelfServiceModule(),
      ],
      didStart: () {
        FlutterGetItBindingRegister.registerPermanentBinding('CAMERAS', [
          Bind.lazySingleton((i) => _cameras),
        ]);
      },
    );
  }
}
