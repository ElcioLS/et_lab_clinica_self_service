import 'package:et_lab_clinica_core/et_lab_clinica_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
  runApp(const LabClinicaSelfServiceApp());
}

class LabClinicaSelfServiceApp extends StatelessWidget {
  const LabClinicaSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicaCoreConfig(
      title: 'Lab Clinica Auto Atendimento',
      pagesBuilders: [
        FlutterGetItPageBuilder(
          page: (_) => const MyHomePage(title: 'title'),
          path: '/',
        )
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
