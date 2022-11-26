import 'package:flutter/material.dart';
import 'package:shus_flutter/common/app_colors.dart';
import 'package:shus_flutter/common/pad.dart';
import 'package:shus_flutter/common/rad.dart';

class SmallTip extends StatelessWidget {
  final Widget child;

  const SmallTip({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Pad.a4,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.tipBorderColor,
        ),
        borderRadius: Rad.a20,
      ),
      child: child,
    );
  }
}
