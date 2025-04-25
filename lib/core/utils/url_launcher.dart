import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlImpl(String url) async {
  final Uri url0 = Uri.parse(url);
  if (!await launchUrl(url0, mode: LaunchMode.externalApplication)) {
    throw Exception('error Could not launch $url0');
  }
}
