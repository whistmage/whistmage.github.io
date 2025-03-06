import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sandbox/entities/career/company.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyTitle extends StatelessWidget {
  const CompanyTitle({super.key, required this.company});

  final Company company;

  @override
  Widget build(BuildContext context) {
    final link = company.link;

    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 16,
      onPressed: link == null ? null : () => _pressLink(link, context),
      child: Text(
        company.name,
        style: TextStyle(
          color: link == null
              ? Theme.of(context).colorScheme.secondaryFixed
              : Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  void _pressLink(Uri link, BuildContext context) async {
    try {
      if (await canLaunchUrl(link)) {
        await launchUrl(link);
      } else {
        throw Exception('Не удалось открыть ссылку');
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Не удалось открыть ссылку'),
          ),
        );
      }
    }
  }
}
