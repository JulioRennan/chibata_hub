import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    required this.intialValue,
    this.onChanged,
  });

  final bool intialValue;
  final Function(bool?)? onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool value = widget.intialValue;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      checkColor: Colors.white,
      activeColor: AppColors.primaryColor,
      fillColor: const MaterialStatePropertyAll(
        AppColors.primaryColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onChanged: (_) {
        setState(() {
          value = !value;
          widget.onChanged?.call(value);
        });
      },
    );
  }
}
