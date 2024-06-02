import 'package:troover_admin/models/_models.dart';
import 'package:troover_admin/samples/samples.dart';

class ImageUtils {
  static String getUserImage(User user) {
    return (user.imageId != null)
        ? imageSamples[user.imageId!]
        : imageSamples[0];
  }
}
