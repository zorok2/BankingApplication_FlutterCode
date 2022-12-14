import 'package:banking_application/API/api_services.dart';
import 'package:banking_application/Component/ButtonWidget.dart';
import 'package:banking_application/Component/FormPassword.dart';
import 'package:banking_application/Pages/register_page/RegisterPage.dart';
import 'package:banking_application/Pages/root_app.dart';
import 'package:banking_application/anim/LoadingAnimationPage.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:banking_application/app_style/app_styles/App_style.dart';
import 'package:banking_application/models/ResponseLogin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quickalert/quickalert.dart';
import 'package:lottie/lottie.dart';

import '../anim/dialog_anim.dart';
import '../app_style/func/CheckValue.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static GlobalKey<FormState> keyLogin = GlobalKey<FormState>();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool isLoading;
  late TextEditingController controller;
  late Size size;
  void setLoading(){
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;
    ApiServices.intance.getRefreshToken();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo1.png',
                  height: 120,
                  width: 120,
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  'DIGITAL BANK',
                  style: App_Style.primaryStyle().copyWith(
                      letterSpacing: 1,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'NG??N H??NG S??? TH??NG MINH',
                  style: App_Style.primaryStyle().copyWith(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400,
                      color: App_color.primaryColor,
                      fontSize: 22),
                ),
                Text(
                  'N??NG T???M CU???C S???NG',
                  style: App_Style.primaryStyle().copyWith(
                      letterSpacing: 1, color: primaryColor, fontSize: 22),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Form(
                  key: LoginPage.keyLogin,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 18),
                        height: size.width * 0.17,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26.withOpacity(0.15),
                                  blurRadius: 9,
                                  offset: const Offset(0, 3))
                            ]),
                        child: Center(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || value == null) {
                                return 'vui l??ng nh???p th??ng tin.';
                              }
                              return null;
                            },
                            controller: controller,
                            onChanged: (value) {},
                            keyboardType: TextInputType.text,
                            style: App_Style.openSanGoogle(18).copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.7)),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: const Icon(
                                Icons.edit,
                              ),
                              labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                              label: const Text(
                                'S??? t??i kho???n / S??? ??i???n tho???i',
                              ),
                            ),
                          ),
                        ),
                      ),
                      FormPassword(
                        size: size,
                        icon: Icons.visibility,
                        lable: 'M???t kh???u',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            isLoading: isLoading,
            size: size,
            text: '????ng nh???p',
            onTapp: () async {
              if (LoginPage.keyLogin.currentState?.validate() == true) {
                String userName = controller.text;
                showDialogIn(context);
                // setLoading();
                String s = await ApiServices.intance.getRefreshToken();
                print('Refresh token: $s');
                ResponseLogin response = await ApiServices.intance.getAcccNo(
                    username: userName, password: FormPassword.password);
                Navigator.pop(context);
                // setLoading();
                print(
                    'login success: ${response.result?.response?.responseMessage}');
                switch (response.result?.response?.responseCode) {
                  case "01":
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.loading,
                      title: 'th??ng b??o',
                      text:
                          't??i kho???n, m???t kh???u kh??ng ch??nh x??c ho???c t??i kho???n c???a b???n kh??ng t???n tai',
                      confirmBtnColor: App_color.primaryColor,
                    );
                    break;
                  case "03":
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.warning,
                      text: 'l???i h??? th???ng, vui l??ng th??? l???i nhe',
                      confirmBtnColor: App_color.primaryColor,
                    );
                    break;
                  case "99":
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.warning,
                      text:
                          'H??? th???ng ??ang b???o tr??, b???n vui l??ng quay l???i sau nh??!',
                      confirmBtnColor: App_color.primaryColor,
                    );
                    break;
                  case "09":
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      text: 't??i kho???n ng??n h??ng kh??ng h???p l???',
                      confirmBtnColor: App_color.primaryColor,
                    );
                    break;
                  case "00":
                    CheckValue.username = userName;
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const Root_app(),
                            type: PageTransitionType.leftToRight,
                            opaque: false));
                    break;
                }
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
                style: TextStyle(
                    color: Colors.blue.shade500.withOpacity(0.7),
                    decoration: TextDecoration.underline,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '????ng k??',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const RegisterPage(),
                                type: PageTransitionType.bottomToTop));
                      },
                  ),
                  const TextSpan(
                      text: '  |  ',
                      style: TextStyle(decoration: TextDecoration.none)),
                  const TextSpan(text: 'Kh??ng th??? ????ng nh???p?'),
                ]),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
