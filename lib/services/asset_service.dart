import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mime_type/mime_type.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social/network/api.dart';
import 'package:social/network/network_utils.dart';
import 'package:social/views/global_components/dialogs/attachment_source_choice_dialog.dart';
import 'package:social/views/styles/k_colors.dart';
import 'package:path_provider/path_provider.dart';

class AssetService {
  static pickFile(bool allowCrop, FilePickerResult result) async {
    if (result != null) {
      PlatformFile file = result.files.first;

      // print(file.name);
      // print(file.bytes);
      // print(file.size);
      // print(file.extension);
      // print(file.path);
      if (allowCrop) {
        File cropped = await ImageCropper.cropImage(
            sourcePath: file.path,
            aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
            compressQuality: 100,
            maxWidth: 700,
            maxHeight: 700,
            compressFormat: ImageCompressFormat.jpg,
            androidUiSettings: AndroidUiSettings(
                toolbarColor: KColor.blue,
                toolbarTitle: "Crop Image",
                statusBarColor: KColor.blue,
                backgroundColor: KColor.white,
                activeControlsWidgetColor: KColor.primary,
                toolbarWidgetColor: KColor.white));
        return cropped;
      }
      return file;
    }
    return null;
  }

  static pickImageVideo(bool allowCrop, context, imageSource, {isVideo = false}) async {
    if (imageSource != null) {
      final ImagePicker _picker = ImagePicker();
      XFile result = isVideo ? await _picker.pickVideo(source: imageSource) : await _picker.pickImage(source: imageSource);

      if (result != null && !isVideo) {
        XFile image = result;

        print(image.name);
        print(image.mimeType);
        print(image.path);
        if (allowCrop) {
          File cropped = await ImageCropper.cropImage(
              sourcePath: image.path,
              aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
              compressQuality: 100,
              maxWidth: 700,
              maxHeight: 700,
              compressFormat: ImageCompressFormat.jpg,
              androidUiSettings: AndroidUiSettings(
                  toolbarColor: KColor.primary,
                  toolbarTitle: "Crop Image",
                  statusBarColor: KColor.primary,
                  backgroundColor: KColor.white,
                  activeControlsWidgetColor: KColor.primary,
                  toolbarWidgetColor: KColor.white));
          return cropped;
        }
        return image;
      } else if (result != null && isVideo) return result;
    }
    return null;
  }

  static pickMedia(bool allowCrop, context, allowFiles, showChoiceDialog) async {
    final mediaSource =
        showChoiceDialog ? await showDialog(context: context, builder: (context) => AttachmentSourceChoiceDialog(isAllowFiles: allowFiles)) : 'file';
    print('mediaSource = $mediaSource');
    if (mediaSource != null) {
      if (mediaSource != 'file')
        return pickImageVideo(allowCrop, context, mediaSource);
      else {
        FilePickerResult result = await FilePicker.platform
            .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png', 'jpeg', 'webp', 'doc', 'pdf'], allowMultiple: false);
        return pickFile(allowCrop, result);
      }
    }
  }

  static uploadMedia(file) async {
    String fileName = file.name;
    print("File name: $fileName");
    String type = (mime(fileName)).split('/')[0];
    print("Type: $type");
    String subType = (mime(fileName)).split('/')[1];
    print("Subtype: $subType");

    var responseBody = await Network.handleResponse(
      await Network.multiPartRequest(
        API.uploadImages,
        'POST',
        file: File(file.path),
        fileFieldName: file.path,
        filename: fileName,
        type: type,
        subType: subType,
      ),
    );

    //print(responseBody);
    return responseBody;
  }

  static uploadCroppedMedia(file) async {
    String fileName = Path.basename(file.path);
    print("File name: $fileName");
    String type = (mime(fileName)).split('/')[0];
    print("Type: $type");
    String subType = (mime(fileName)).split('/')[1];
    print("Subtype: $subType");

    var responseBody = await Network.handleResponse(
      await Network.multiPartRequest(
        API.uploadImages,
        'POST',
        file: File(file.path),
        fileFieldName: file.path,
        filename: fileName,
        type: type,
        subType: subType,
      ),
    );

    //print(responseBody);
    return responseBody;
  }

  static downloadFile(imageUrl) async {
    Dio dio = Dio();
    var dir = await getApplicationDocumentsDirectory();
    print('dur == $dir');
    String fileName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);
    toast('Download in progress...');
    dio.download(
      imageUrl,
      "${dir.path}/$fileName",
      onReceiveProgress: (rec, total) {
        if ((rec / total * 100.0).toStringAsFixed(0) == '10') return toast('Download completed!', bgColor: KColor.green);
        print('fileName = $fileName');
        print("Downloading File : " + (rec / total * 100.0).toStringAsFixed(0));
      },
    );
  }
}
