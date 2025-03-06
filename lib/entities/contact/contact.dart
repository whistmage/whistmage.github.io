sealed class Contact {}

class TelegramContact extends Contact {
  TelegramContact({required this.link});

  final String link;
}

class EmailContact extends Contact {
  EmailContact({required this.address});

  final String address;
}

class GithubContact extends Contact {
  GithubContact({required this.link});

  final String link;
}
