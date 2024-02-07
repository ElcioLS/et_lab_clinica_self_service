import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../self_service_controller.dart';

class LabClinicaSelfServiceAppBar extends LabClinicaAppBar {
  LabClinicaSelfServiceAppBar({super.key})
      : super(actions: [
          PopupMenuButton(
            child: const IconPopupMenuWidget(),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(value: 1, child: Text('Reiniciar Processo'))
              ];
            },
            onSelected: (value) async {
              Injector.get<SelfServiceController>().restartProcess();
            },
          ),
        ]);
}
