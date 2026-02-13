import 'package:flutter/material.dart';

import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

class LaserConsentDialog extends StatefulWidget {
  const LaserConsentDialog({
    super.key,
    required this.onAccepted,
  });

  final Future<void> Function() onAccepted;

  @override
  State<LaserConsentDialog> createState() => _LaserConsentDialogState();
}

class _LaserConsentDialogState extends State<LaserConsentDialog> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return AlertDialog(
      backgroundColor: const Color(0xFF111111),
      title: Text(
        loc.laserConsentTitle,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: 420,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  loc.laserConsentText,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                    height: 1.3,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            CheckboxListTile(
              value: _checked,
              onChanged: (v) => setState(() => _checked = v ?? false),
              title: Text(
                loc.laserConsentCheckboxLabel,
                style: const TextStyle(fontSize: 13),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.white,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(loc.commonCancel),
        ),
        ElevatedButton(
          onPressed: _checked
              ? () async {
                  await widget.onAccepted();
                  if (!context.mounted) return;
                  Navigator.of(context).pop(true);
                }
              : null,
          child: Text(loc.laserConsentContinue),
        ),
      ],
    );
  }
}
