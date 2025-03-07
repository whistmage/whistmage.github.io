import 'package:injectable/injectable.dart';
import 'package:sandbox/entities/career/company.dart';
import 'package:url_launcher/url_launcher.dart';

@injectable
class OpenCompanyLinkCase {
  Future<void> run({required Company company}) async {
    final link = company.link;
    if (link == null) {
      throw Exception('Company link is empty');
    }
    if (await canLaunchUrl(link)) {
      await launchUrl(link);
    } else {
      throw Exception('''Can't open link: ${link.toString()}''');
    }
  }
}
