import 'package:et_lab_clinica_self_service/src/modules/self_service/self_service_contoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class WhoIAmPage extends StatelessWidget {
  const WhoIAmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Who I Am'),
      ),
      body: Column(
        children: [
          Container(),
          ElevatedButton(
              onPressed: () {
                Injector.get<SelfServiceContoller>().goPatient();
              },
              child: Text('Go Patient'))
        ],
      ),
    );
  }
}
