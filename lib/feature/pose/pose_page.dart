import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PosePage extends StatefulWidget {
  const PosePage({Key? key}) : super(key: key);

  @override
  State<PosePage> createState() => _PosePageState();
}

class _PosePageState extends State<PosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('pose'),
            const SizedBox(height: 16),
            Text(
              'current route path: ${ModalRoute.of(context)?.settings.name}',
            ),
            const SizedBox(height: 16),
            TextButton(
              child: const Text('pop'),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
