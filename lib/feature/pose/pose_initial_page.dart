import 'package:flutter/material.dart';
import 'package:shus_flutter/common/styles.dart';
import 'package:shus_flutter/common/ui_components/space.dart';

class PoseInitialPage extends StatefulWidget {
  const PoseInitialPage({super.key});

  @override
  State<PoseInitialPage> createState() => _PoseInitialPageState();
}

class _PoseInitialPageState extends State<PoseInitialPage> {
  final controller = TextEditingController();
  String fileName = "-------";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('身長を入力してください', style: Styles.body),
            Space.h8,
            TextField(
              controller: controller,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            Space.h8,
            Text(fileName, style: Styles.body),
            Space.h8,
            TextButton(
              onPressed: () {},
              child: const Text('写真を選ぶ', style: Styles.body),
            ),
            Space.h8,
            TextButton(
              onPressed: () {},
              child: const Text('決定', style: Styles.body),
            ),
          ],
        ),
      ),
    );
  }
}
