import 'package:flutter/material.dart';
import 'package:sandbox/entities/career/company.dart';
import 'package:sandbox/ui/appereance/link_button_style_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyTitle extends StatelessWidget {
  const CompanyTitle({super.key, required this.company});

  final Company company;

  @override
  Widget build(BuildContext context) {
    final linkButtonStyleExtension =
        Theme.of(context).extension<LinkButtonStyleExtension>();
    final link = company.link;
    final leftOffset = linkButtonStyleExtension?.padding.left ?? 0;
    return Transform.translate(
      offset: Offset(-leftOffset, 0.0),
      child: TextButton(
        onPressed: link == null ? null : () => _pressLink(link, context),
        style: linkButtonStyleExtension?.buttonStyle,
        child: Text(company.name),
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
