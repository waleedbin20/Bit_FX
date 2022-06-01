import 'dart:io';
import 'dart:math';
import 'package:bitfx_application/core/services/auth_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageProviderr {
  AuthenticationService service = AuthenticationService();

  Future<void> _uploadImageToFirebase(File sampleImage) async {
    // Make random image name.
    int randomNumber = Random().nextInt(100000);
    // String imageLocation = 'images/images$randomNumber.jpg';
    String imageLocation =
        'images/${service.getEmail()}/images$randomNumber.jpg';

    // Upload image to firebase.
    final Reference storageReference =
        FirebaseStorage.instance.ref().child(imageLocation);
    final UploadTask uploadTask = storageReference.putFile(sampleImage);
    _addPathToDatabase(imageLocation);
  }

  Future<void> _addPathToDatabase(String text) async {
    try {
      // Get image URL from firebase
      final ref = FirebaseStorage.instance.ref().child(text);
      var imageString = await ref.getDownloadURL();
    } catch (e) {
      print('error loading image');
    }
  }
}
