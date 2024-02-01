import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../core/env.dart';

class LabClinicaApplicationBinding extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton<RestClient>(
          (i) => RestClient(
            Env.backendBaseUrl,
          ),
        ),
      ];
}
