import 'package:injectable/injectable.dart';
import 'package:sandbox/entities/contact/contact.dart';
import 'package:url_launcher/url_launcher.dart';

@injectable
class OpenContactCase {
  Future<void> run({required Contact contact}) async {
    final Uri link;
    switch (contact) {
      case TelegramContact():
        link = Uri.parse(contact.link);
      case EmailContact():
        link = Uri(scheme: 'mailto', path: contact.address);
      case GithubContact():
        link = Uri.parse(contact.link);
    }
    if (await canLaunchUrl(link)) {
      await launchUrl(link);
    } else {
      throw Exception('''Can't open link: ${link.toString()}''');
    }
  }
}
