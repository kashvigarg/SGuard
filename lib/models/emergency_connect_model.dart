import 'package:url_launcher/url_launcher.dart';

class EmergencyMethods {
  _makePhoneCall() async {
    var url = Uri.parse("tel:9667964943");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

// TODO : implement ping emergency contacts
  _pingEmergencyContacts() async {}
}
