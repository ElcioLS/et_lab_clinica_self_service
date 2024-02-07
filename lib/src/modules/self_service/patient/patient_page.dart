import 'package:brasil_fields/brasil_fields.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:et_lab_clinica_self_service/src/modules/self_service/patient/patient_form_controller.dart';
import 'package:et_lab_clinica_self_service/src/modules/self_service/widgets/lab_clinica_self_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validatorless/validatorless.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> with PatientFormController {
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    disposeForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicaSelfServiceAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * .85,
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicaTheme.orangeColor),
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset('assets/images/check_icon.png'),
                  const SizedBox(height: 24),
                  const Text(
                    'Cadastro encontrado',
                    style: LabClinicaTheme.titleSmallStyle,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Confira os dados do seu cadastro',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: LabClinicaTheme.blueColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: nameEC,
                    validator: Validatorless.required('Nome obrigatório'),
                    decoration: const InputDecoration(
                      label: Text('Nome do Paciente'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                    decoration: const InputDecoration(
                      label: Text('E-mail'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: phoneEC,
                    validator: Validatorless.required('Telefone obrigatório'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      label: Text('Telefone'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: documentEC,
                    validator: Validatorless.required('CPF obrigatório'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      label: Text('Digite o CPF'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: cepEC,
                    validator: Validatorless.required('CPF obrigatório'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      label: Text('Digite seu CPF'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        flex: 3,
                        child: TextFormField(
                          controller: streetEC,
                          validator:
                              Validatorless.required('Rua é obrigatório'),
                          decoration: const InputDecoration(
                            label: Text('Endereço'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        flex: 1,
                        child: TextFormField(
                          controller: numberEC,
                          validator:
                              Validatorless.required('Número obrigatório'),
                          decoration: const InputDecoration(
                            label: Text('Número'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: complementEC,
                          decoration: const InputDecoration(
                            label: Text('Complemento'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: stateEC,
                          validator:
                              Validatorless.required('Estado obrigatório'),
                          decoration: const InputDecoration(
                            label: Text('Estado'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: cityEC,
                          validator:
                              Validatorless.required('Cidade obrigatório'),
                          decoration: const InputDecoration(
                            label: Text('Cidade'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: districtEC,
                          validator:
                              Validatorless.required('Bairro obrigatório'),
                          decoration: const InputDecoration(
                            label: Text('Bairro'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: guardianEC,
                    decoration: const InputDecoration(
                      label: Text('Responsável'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: guardianIdentificationNumberEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      label: Text('Documento de Identificação'),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Text('Editar'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 17),
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Continuar'),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
