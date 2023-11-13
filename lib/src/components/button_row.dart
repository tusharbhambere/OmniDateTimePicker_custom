import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key, required this.onSavePressed});

  final void Function() onSavePressed;

  @override
  Widget build(BuildContext context) {
    final localizations = MaterialLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            height: 45,
            decoration: const BoxDecoration(
              color: Color(0xFF1a74e9),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop<DateTime>();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.south,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    localizations.cancelButtonLabel,
                    style: const TextStyle(
                      fontSize: 13,
                      letterSpacing: 0.1,
                      fontFamily: 'Display-Semibold',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 45,
            decoration: const BoxDecoration(
              color: Color(0xFF8041e0),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: TextButton(
              onPressed: onSavePressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.east,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    localizations.okButtonLabel,
                    style: const TextStyle(
                      fontSize: 13,
                      letterSpacing: 0.1,
                      fontFamily: 'Display-Semibold',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
