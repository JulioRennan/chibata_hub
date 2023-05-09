import 'dart:async';

import 'package:chibata_hub/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.child,
    this.onPressed,
  });
  final Widget child;
  final FutureOr<void> Function()? onPressed;
  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: 40,
        width: constraints.maxWidth,
        child: ElevatedButton(
          onPressed: widget.onPressed == null
              ? null
              : () async {
                  if (isLoading) return;
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await widget.onPressed?.call();
                  } finally {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: MaterialStateColor.resolveWith(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade300;
                }
                return AppColors.primaryColor;
              },
            ),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return DefaultTextStyle(
              style: StyleThemes.button,
              child: Builder(builder: (context) {
                if (isLoading) {
                  return Center(
                    child: SizedBox(
                      width: constraints.maxHeight - 10,
                      height: constraints.maxHeight - 10,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1.5,
                      ),
                    ),
                  );
                }
                return widget.child;
              }),
            );
          }),
        ),
      );
    });
  }
}
