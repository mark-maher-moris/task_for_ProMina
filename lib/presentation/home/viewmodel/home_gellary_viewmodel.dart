import 'dart:io';
import 'package:flutter/material.dart';
import 'package:task_for_promina_agency/services/network_service.dart';
import '../../login/view/login_view.dart';
import '../model/gellary_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class HomeGellaryViewmodel extends ChangeNotifier {
  List<String> _images = [];
  GalleryResponse? _galleryResponse;
  NetworkService _networkService = NetworkService(baseUrl: ApiConsts.baseUrl);

  Future<void> fetchGellary() async {
    // await _networkService.get(ApiConsts.getGellary).then((value) {});
    await _networkService.get(ApiConsts.getGellary).then((value) {
      _galleryResponse = GalleryResponse.fromJson(value.data);
      print(_galleryResponse?.message);
    }).catchError((e) {
      print(e);
    });
    notifyListeners();
  }



  File? _choosenImage;
  final ImagePicker _picker = ImagePicker();
  Future<void> takePhoto() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _choosenImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _choosenImage = File(pickedFile.path);
    
      notifyListeners();
    }
  }

  List<String> get images => _images;
  GalleryResponse? get galleryResponse => _galleryResponse;
  File? get choosenImage => _choosenImage;

}



