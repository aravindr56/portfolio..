import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> storeUrlInFirestore() async {
  String url = "https://firebasestorage.googleapis.com/v0/b/myportfolio-afa4c.appspot.com/o/flutter.pdf?alt=media&token=873555ae-c902-412f-b98b-2b5120c1f53d";
  try {
    await FirebaseFirestore.instance.collection('cv_urls').add({'url': url});
    print("URL successfully written to Firestore");
  } catch (e) {
    print("Error writing URL to Firestore: $e");
  }
}



