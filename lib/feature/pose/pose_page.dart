import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shus_flutter/common/interface/flutter_image.dart';
import 'package:shus_flutter/common/ui_components/space.dart';
import 'package:shus_flutter/feature/pose/pose_output.dart';

class PoseResultPage extends StatefulWidget {
  final PoseOutput output;

  const PoseResultPage({Key? key, required this.output}) : super(key: key);

  @override
  State<PoseResultPage> createState() => _PoseResultPageState();
}

class _PoseResultPageState extends State<PoseResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: _imageView(context)),
          _bottomView(context),
        ],
      ),
    );
  }

  Widget _imageView(BuildContext context) {
    switch (widget.output.image.imageFileType) {
      case ImageFileType.file:
        final file = File(widget.output.image.value);
        return Image.file(file);
      case ImageFileType.bytes:
        return Image.memory(widget.output.image.value);
    }
  }

  Widget _bottomView(BuildContext context) {
    return Column(
      children: [
        Space.inf,
        TextButton(
          child: const Text('戻る'),
          onPressed: () => context.popRoute(),
        ),
        Space.h48,
      ],
    );
  }
}
