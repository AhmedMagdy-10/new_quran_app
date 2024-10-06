import 'dart:io';
import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran_app/core/helper/show_toast_state.dart';
import 'package:share_plus/share_plus.dart';

Future<void> saveImageToMobile(Uint8List imageBytes) async {
  try {
    final imageSaved = await ImageGallerySaver.saveImage(imageBytes,
        quality: 100, name: "screenShot");

    if (imageSaved != null && imageSaved['isSuccess']) {
      showToast(text: 'تم حفظ الصورة', state: ToastStates.success);
    } else {
      showToast(text: 'تعذر حفظ الصورة', state: ToastStates.error);
    }
  } catch (e) {
    showToast(text: e.toString(), state: ToastStates.error);
    print(e.toString());
  }
}

Future<void> shareImage(Uint8List screenImage) async {
  try {
    final tempDir = await getTemporaryDirectory();
    print(tempDir.path);

    final imageFile = File('${tempDir.path}/screen_image.png');

    await imageFile.writeAsBytes(screenImage);
    Share.shareXFiles(
      [XFile(imageFile.path)],
    );
  } catch (e) {
    print('Error sharing image: $e');
  }
}
