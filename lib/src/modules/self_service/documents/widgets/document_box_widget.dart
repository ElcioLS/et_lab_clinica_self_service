import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:flutter/material.dart';

class DocumentBoxWidget extends StatelessWidget {
  const DocumentBoxWidget(
      {super.key,
      required this.uploaded,
      required this.icon,
      required this.label,
      required this.totalFiles});

  final Widget icon;
  final bool uploaded;
  final String label;
  final int totalFiles;

  @override
  Widget build(BuildContext context) {
    final totalFilesLabel = totalFiles > 0 ? '($totalFiles)' : '';

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: uploaded ? LabClinicaTheme.lightOrangeColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: LabClinicaTheme.orangeColor),
        ),
        child: Column(
          children: [
            Expanded(child: icon),
            Text(
              '$label $totalFilesLabel',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: LabClinicaTheme.orangeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
