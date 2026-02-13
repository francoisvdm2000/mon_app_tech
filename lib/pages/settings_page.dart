import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/locale_provider.dart';
import 'package:mon_app_tech/l10n_gen/app_localizations.dart';

class PageSettings extends StatelessWidget {
  const PageSettings({super.key});

  String _label(String code) {
    switch (code) {
      case 'fr':
        return 'Français';
      case 'en':
        return 'English';
      case 'nl':
        return 'Nederlands';
      case 'de':
        return 'Deutsch';
      case 'es':
        return 'Español';
      case 'pt':
        return 'Português';
      default:
        return code.toUpperCase();
    }
  }

  String _flag(String? code) {
    // null = système
    if (code == null) return '🌐';
    switch (code) {
      case 'fr':
        return '🇫🇷';
      case 'en':
        return '🇬🇧'; // ou 🇺🇸 si tu préfères
      case 'nl':
        return '🇳🇱';
      case 'de':
        return '🇩🇪';
      case 'es':
        return '🇪🇸';
      case 'pt':
        return '🇵🇹';
      default:
        return '🏳️';
    }
  }

  Widget _flagTitle(String flag, String text) {
    return Row(
      children: [
        Text(
          flag,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(text)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LocaleProvider>();
    final loc = AppLocalizations.of(context);

    // null = système
    final forcedCode = provider.locale?.languageCode;

    // info langue système résolue (avec fallback FR)
    final systemCode = provider
        .resolveSystemLocale(Localizations.localeOf(context))
        .languageCode;

    void applySelection(String? code) {
      if (code == null) {
        provider.useSystemLocale();
      } else {
        provider.setLocale(code);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(loc.settings)),
      body: RadioGroup<String?>(
        groupValue: forcedCode,
        onChanged: applySelection,
        child: ListView(
          children: [
            ListTile(
              title: Text(
                loc.language,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            RadioListTile<String?>(
              value: null,
              title: _flagTitle(_flag(null), loc.languageSystem),
              subtitle: Text(
                '${loc.languageSystemCurrent}: ${_flag(systemCode)} ${_label(systemCode)}',
              ),
            ),
            const Divider(height: 1),
            ...provider.supportedLocales.map((locale) {
              final code = locale.languageCode;
              return RadioListTile<String?>(
                value: code,
                title: _flagTitle(_flag(code), _label(code)),
              );
            }),
          ],
        ),
      ),
    );
  }
}
