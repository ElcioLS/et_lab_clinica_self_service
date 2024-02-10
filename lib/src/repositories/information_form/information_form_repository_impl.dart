import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:et_lab_clinica_self_service/src/models/self_service_model.dart';

import '../../models/patient_model.dart';
import './information_form_repository.dart';

class InformationFormRepositoryImpl implements InformationFormRepository {
  InformationFormRepositoryImpl({
    required this.restClient,
  });

  final RestClient restClient;
  @override
  Future<Either<RepositoryException, Unit>> register(
      SelfServiceModel model) async {
    try {
      final SelfServiceModel(
        :name!,
        :lastName!,
        patient: PatientModel(id: patientId)!,
        documents: {
          DocumentType.healthInsuranceCard: List(first: healthInsuranceCardDoc),
          DocumentType.medicalOrder: medicalOrderDocs,
        }!
      ) = model;

      await restClient.auth.post('/patientInformationForm', data: {
        'patient_id': patientId,
        'health_insurance_card': healthInsuranceCardDoc,
        'medical_order': medicalOrderDocs,
        'password': '$name $lastName',
        'date_created': DateTime.now().toIso8601String(),
        'status': 'Waiting',
        'tests': [],
      });
      return Right(unit);
    } on DioException catch (e, s) {
      log(
        'Erro ao finaliar formulário de auto atendimento.',
        error: e,
        stackTrace: s,
      );
      return Left(RepositoryException());
    }
  }
}