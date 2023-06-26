import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsController extends GetxController {
  final Uri whatsapp = Uri.parse('https://wa.me/+6285743110778');
  final Uri instagram = Uri.parse('https://www.instagram.com/ahmad_zulfikar123/');

  void openWhatsAppLink() {
    launchUrl(
      whatsapp,
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }
  void openInstagramLink() {
    launchUrl(
      instagram,
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }
}
