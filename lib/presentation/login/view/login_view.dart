import 'package:flutter/material.dart';
import 'package:task_for_promina_agency/resources/routes_manager.dart';
import 'package:task_for_promina_agency/resources/strings_manager.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/image_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../services/network_service.dart';
import '../../../utils/custom_box.dart';
import '../../../utils/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController userNameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                ImagesManager.background,
                fit: BoxFit.cover,
              )),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(StringsManager.myGellary,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AppSize.s40,
                        color: ColorManager.darkGrey,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: AppSize.s40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p18),
                  child: CustomBox(
                    blury: true,
                    backgroundColor: Colors.transparent,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 40),
                      child: Column(
                        children: [
                          Text(StringsManager.login,
                              style: TextStyle(
                                  fontSize: AppSize.s20,
                                  color: ColorManager.darkGrey)),
                          CustomTextField(
                            hint: StringsManager.userName,
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          CustomTextField(
                            hint: StringsManager.password,
                            controller: userNameController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: AppSize.s60),
                          submitButton(context),
                        ],
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 50),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget submitButton(BuildContext context) {
    return InkWell(
      onTap: () {
        login(userNameController.text, passwordController.text).then((value) {
          //if (value) Navigator.pushReplacementNamed(context, Routes.homeRoute);
        });
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      },
      child: Container(
        height: AppSize.s60,
        child: Center(
            child: Text(
          StringsManager.submit,
          style: TextStyle(color: ColorManager.white),
        )),
        decoration: BoxDecoration(
            color: ColorManager.blue, borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}

class ApiConsts {
  static String baseUrl = 'https://flutter.prominaagency.com/api/';
  static String uploadImage = 'upload';
  static String login = 'auth/login';
  static String getGellary = 'my-gallery';
}

Future<bool> login(String email, String password) async {
  NetworkService networkService = NetworkService(baseUrl: ApiConsts.baseUrl);
  await networkService.post(ApiConsts.login,
      data: {'password': password, 'email': email}).then((v) {
    print(v.data);
    return true;
  }).catchError((e) {
    print(e);
    return false;
  });
  return false;
}
