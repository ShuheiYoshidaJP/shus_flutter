import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shus_flutter/common/styles.dart';
import 'package:shus_flutter/common/ui_components/length_text_field.dart';
import 'package:shus_flutter/common/ui_components/space.dart';

class PoseInitialPage extends StatefulWidget {
  const PoseInitialPage({super.key});

  @override
  State<PoseInitialPage> createState() => _PoseInitialPageState();
}

class _PoseInitialPageState extends State<PoseInitialPage> {
  final picker = ImagePicker();
  String label = '';
  double height = 100.0;
  PickedFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (label != '') ...{
            Text(
              label,
              style: Styles.body,
            ),
            Space.h8,
          },
          if (file != null) ...{
            Image.file(
              File(file!.path),
              width: 100,
              height: 100,
            ),
            Space.h8,
          },
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '身長: ',
                style: Styles.body,
              ),
              Space.w8,
              LengthTextField(
                initialValue: height,
                width: 100.0,
                suffixValue: 'cm',
                valueStyle: Styles.input,
                suffixStyle: Styles.inputSuffix,
                onSubmitted: ((heightStr) {
                  setState(() {
                    try {
                      final parsedHeight = double.parse(heightStr);
                      setState(() {
                        height = parsedHeight;
                        label = '';
                      });
                    } catch (e) {
                      setState(() {
                        label = '身長が不正です';
                      });
                    }
                  });
                }),
              ),
            ],
          ),
          Space.h8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('画像: ', style: Styles.body),
              Space.w8,
              Row(
                children: [
                  IconButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    icon: const Icon(Icons.photo),
                  ),
                  Space.w8,
                  IconButton(
                    onPressed: () => _pickImage(ImageSource.camera),
                    icon: const Icon(Icons.camera),
                  ),
                ],
              ),
            ],
          ),
          if (file != null && height > 0) ...{
            Space.h8,
            TextButton(
              onPressed: () {},
              child: const Text('決定', style: Styles.body),
            ),
          },
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      file = pickedFile;
    });
  }
}