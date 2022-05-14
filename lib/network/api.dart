import 'package:social/services/app_mode.dart';

class API {
  static const LIVE = ''; // Live Production API URL
  static const TEST = ''; // Live Staging API URL
  static const BASE = AppMode.PRODUCTION_MODE ? LIVE : TEST;

  /// Upload Image
  static const uploadImages = 'upload/uploadImages1';
}
