import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_for_promina_agency/presentation/home/viewmodel/home_gellary_viewmodel.dart';
import 'package:task_for_promina_agency/resources/color_manager.dart';
import 'package:task_for_promina_agency/resources/image_manager.dart';
import 'package:task_for_promina_agency/utils/custom_box.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Consumer<HomeGellaryViewmodel>(
      builder: (BuildContext context, value, Widget? child) {
        return SafeArea(
          child: Scaffold(
              body: Stack(
            children: [
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset(
                    ImagesManager.background2,
                    fit: BoxFit.cover,
                  )),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p18, vertical: AppPadding.p12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              StringsManager.welcome + ' Mina',
                              style: TextStyle(
                                fontSize: AppSize.s30,
                              ),
                            ),
                            width: screenWidth * 0.65,
                          ),
                          CircleAvatar(
                            backgroundColor: ColorManager.white,
                            radius: AppSize.s40,
                            child: FlutterLogo(size: AppSize.s40),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppSize.s40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomBox(
                              backgroundColor: ColorManager.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset(ImagesManager.leftArrow),
                                    SizedBox(width: AppSize.s12),
                                    Text(StringsManager.logOut),
                                  ],
                                ),
                              ),
                              onTap: () {},
                              blury: false),
                          CustomBox(
                              backgroundColor: ColorManager.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset(ImagesManager.topArrow),
                                    SizedBox(width: AppSize.s12),
                                    Text(StringsManager.upload),
                                  ],
                                ),
                              ),
                              onTap: () {
                                showUploadDialog(context);
                              },
                              blury: false)
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Provider.of<HomeGellaryViewmodel>(context,
                                listen: false)
                            .fetchGellary();
                      },
                      child: Text('OOOO'),
                    )
                    // GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}

showUploadDialog(BuildContext context) {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Future<void> _takePhoto() async {
  //   final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);

  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }

  // Future<void> _pickImageFromGallery() async {
  //   final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }
  showDialog(
      barrierColor: Colors.white.withOpacity(0),
      context: context,
      builder: (_) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.2),
          content: Container(
            height: 300,
            width: 300,
            child: CustomBox(
                backgroundColor: Colors.transparent,
                child: Container(
                  height: 400,
                  width: 300,
                  child: Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppSize.s18),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomBox(
                              backgroundColor: ColorManager.white,
                              child: Container(
                                margin: EdgeInsets.all(AppSize.s8),
                                height: AppSize.s40,
                                width: AppSize.s300,
                                child: Row(
                                  children: [
                                    Image.asset(ImagesManager.gellary),
                                    Text(StringsManager.gellary),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Provider.of<HomeGellaryViewmodel>(context,
                                        listen: false)
                                    .pickImageFromGallery();
                              },
                              blury: false,
                            ),
                            SizedBox(height: AppSize.s12),
                            CustomBox(
                              backgroundColor: ColorManager.white,
                              child: Container(
                                margin: EdgeInsets.all(AppSize.s8),
                                height: AppSize.s40,
                                width: AppSize.s300,
                                child: Row(
                                  children: [
                                    Image.asset(ImagesManager.camera),
                                    Text(StringsManager.camera),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Provider.of<HomeGellaryViewmodel>(context,
                                        listen: false)
                                    .takePhoto();
                              },
                              blury: false,
                            ),
                          ]),
                    ),
                  ),
                ),
                onTap: () {},
                blury: true),
          ),
        );
      });
}
