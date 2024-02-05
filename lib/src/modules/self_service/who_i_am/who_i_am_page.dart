import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:et_lab_clinica_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validatorless/validatorless.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});

  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> {
  final selfServiceController = Injector.get<SelfServiceController>();
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final lastNameEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    lastNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        nameEC.text = '';
        lastNameEC.text = '';
        selfServiceController.clearForm();
      },
      child: Scaffold(
        appBar: LabClinicaAppBar(
          actions: [
            PopupMenuButton(
              child: const IconPopupMenuWidget(),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                      value: 1, child: Text('Finalizar Terminal'))
                ];
              },
              onSelected: (value) async {
                if (value == 1) {
                  final nav = Navigator.of(context);
                  await SharedPreferences.getInstance().then(
                    (sp) => sp.clear(),
                  );
                  nav.pushNamedAndRemoveUntil('/', (route) => false);
                }
              },
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (_, constraints) {
            var sizeOf = MediaQuery.sizeOf(context);
            return SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background_login.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    width: sizeOf.width * .8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Image.asset('assets/images/logo_vertical.png'),
                          const SizedBox(height: 48),
                          const Text(
                            'Bem Vindo!',
                            style: LabClinicaTheme.titleStyle,
                          ),
                          const SizedBox(height: 48),
                          TextFormField(
                            controller: nameEC,
                            validator:
                                Validatorless.required('Nome Obrigatório'),
                            decoration: const InputDecoration(
                                label: Text('Digite seu nome:')),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: lastNameEC,
                            validator:
                                Validatorless.required('Sobrenome obrigatório'),
                            decoration: const InputDecoration(
                                label: Text('Digite seu sobrenome:')),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: sizeOf.width * .8,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                final valid =
                                    formKey.currentState?.validate() ?? false;
                                if (valid) {
                                  selfServiceController
                                      .setWhoIAmDataStepAndNext(
                                    nameEC.text,
                                    lastNameEC.text,
                                  );
                                }
                              },
                              child: const Text('CONTINUAR'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
