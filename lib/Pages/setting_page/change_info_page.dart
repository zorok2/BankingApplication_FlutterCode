import 'package:banking_application/Pages/setting_page/changePassword_page.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:banking_application/app_style/app_styles/App_style.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Change_Info_Page extends StatefulWidget {
  const Change_Info_Page({Key? key}) : super(key: key);

  @override
  State<Change_Info_Page> createState() => _Change_Info_PageState();
}

class _Change_Info_PageState extends State<Change_Info_Page> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              const SizedBox(
                height: 55,
                width: 55,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white24, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.mode_edit_outline_outlined,
                    color: Colors.grey,
                    size: 17,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'nguyen van nghia'.toUpperCase(),
            style: const TextStyle(
                color: App_color.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                buildForm(),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const ChangePassword_page(),
                              type: PageTransitionType.leftToRightWithFade));
                    },
                    child: buildFormPassword()),
                const SizedBox(
                  height: 15,
                ),
                buildFormEmailorSdt('Nqpaybanking@gmail.com', '?????a ch??? email'),
                const SizedBox(
                  height: 15,
                ),
                buildFormEmailorSdt('1800819823', 's??? ??i???n tho???i'),
                const SizedBox(
                  height: 15,
                ),
                buildFormAddress(
                    '40D12 K??T V???n Ph??c, Th??nh Ph??? Th??? ?????c', '?????a ch??? hi???n t???i')
              ],
            ),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          )),
    );
  }

  String hint8(int kitu) {
    String rs = "";
    for (int i = 0; i < kitu; i++) {
      rs += '*';
    }
    return rs;
  }

  String convertObscure(String content) {
    int counter = content.length;
    String result = "";
    int temp = 0;
    if (counter > 15) {
      temp = content.substring(0, counter - 13).length;
      result = hint8(temp) + content.substring(counter - 13);
    } else {
      temp = content.substring(0, counter - 4).length;
      result = hint8(temp) + content.substring(counter - 4);
    }

    return result;
  }

  Form buildFormAddress(String content, String lable) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            style: App_Style.regularStyle(16).copyWith(height: 1.4),
            initialValue: content,
            textAlignVertical: TextAlignVertical.center,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.edit, size: 20),
                focusColor: grayColor.withOpacity(0.5),
                contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
                label: Text(
                  lable.toUpperCase(),
                  style: App_Style.regularStyle(18),
                )),
            enabled: false,
            maxLines: 1,
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }

  Form buildFormSuffixIcon(String content, String lable) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            style: App_Style.regularStyle(16).copyWith(height: 1.4),
            initialValue: convertObscure(content),
            textAlignVertical: TextAlignVertical.center,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.edit, size: 20),
                focusColor: grayColor.withOpacity(0.5),
                contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
                label: Text(
                  lable.toUpperCase(),
                  style: App_Style.regularStyle(18),
                )),
            textInputAction: TextInputAction.next,
            enabled: false,
            maxLines: 1,
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }

  Form buildFormPassword() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            style: App_Style.regularStyle(16).copyWith(height: 1.4),
            initialValue: '0378389282',
            obscureText: true,
            obscuringCharacter: '*',
            textAlignVertical: TextAlignVertical.center,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.edit, size: 20),
                focusColor: grayColor.withOpacity(0.5),
                contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
                label: Text(
                  'm???t kh???u'.toUpperCase(),
                  style: App_Style.regularStyle(18),
                )),
            textInputAction: TextInputAction.next,
            enabled: false,
            maxLines: 1,
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }

  Form buildFormEmailorSdt(String value, String label) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            style: App_Style.regularStyle(16).copyWith(height: 1.4),
            initialValue: convertObscure(value),
            textAlignVertical: TextAlignVertical.center,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
                focusColor: grayColor.withOpacity(0.5),
                contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
                label: Text(
                  label.toUpperCase(),
                  style: App_Style.regularStyle(18),
                )),
            textInputAction: TextInputAction.next,
            enabled: false,
            maxLines: 1,
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }

  Form buildForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            style: App_Style.regularStyle(16).copyWith(height: 1.4),
            initialValue: '0378389282',
            textAlignVertical: TextAlignVertical.center,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
                focusColor: grayColor.withOpacity(0.5),
                contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
                label: Text(
                  'T??n ????ng nh???p / S??? ??i???n tho???i'.toUpperCase(),
                  style: App_Style.regularStyle(18),
                )),
            textInputAction: TextInputAction.next,
            enabled: false,
            maxLines: 1,
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
