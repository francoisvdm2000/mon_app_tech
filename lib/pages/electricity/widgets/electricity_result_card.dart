import 'package:flutter/material.dart';

class ElectricityResultCard extends StatelessWidget {
  const ElectricityResultCard({
    super.key,
    this.icon = Icons.bolt,
    this.title,
    this.color = Colors.lightBlueAccent,
    this.mainValue,
    this.mainLabel,
    this.children = const <Widget>[],
    this.label,
    this.value,
  });

  final IconData icon;
  final String? title;
  final Color color;
  final String? mainValue;
  final String? mainLabel;
  final List<Widget> children;

  /// Legacy compact API used by older electricity pages.
  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    final resolvedMainValue = mainValue ?? value ?? '—';
    final resolvedMainLabel = mainLabel ?? label ?? '';
    final resolvedTitle = title ?? resolvedMainLabel;

    return Card(
      elevation: 0,
      color: color.withValues(alpha: 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: color.withValues(alpha: 0.55), width: 1.3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(icon, color: color, size: 34),
            const SizedBox(height: 12),
            Text(
              resolvedMainValue,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            if (resolvedMainLabel.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                resolvedMainLabel,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white60),
              ),
            ],
            if (resolvedTitle.isNotEmpty && resolvedTitle != resolvedMainLabel) ...[
              const SizedBox(height: 18),
              Text(
                resolvedTitle,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
            if (children.isNotEmpty) ...[
              const SizedBox(height: 10),
              ...children,
            ],
          ],
        ),
      ),
    );
  }
}

class ElectricityInfoRow extends StatelessWidget {
  const ElectricityInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 15),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: valueColor ?? Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
