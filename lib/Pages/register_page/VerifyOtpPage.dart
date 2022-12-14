import 'package:banking_application/Pages/register_page/InfoRegisterPage.dart';
import 'package:banking_application/Provider/InfoAccount.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:banking_application/app_style/app_styles/App_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({Key? key, required this.sdt}) : super(key: key);
  final String sdt;
  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  String? txtError = "";
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<InfoAccountProvider>(context, listen: false).sdt = widget.sdt;
    print('sdt la: ${Provider.of<InfoAccountProvider>(context, listen: false).sdt}');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizedBox buildSizedBox({required TextEditingController controller, required BuildContext context, required bool first, required bool last}) {
      return SizedBox(
        height: 58,
        width: 54,
        child: TextField(
          autofocus: true,
          showCursor: true,
          controller: controller,
          decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              focusColor: Colors.red,
              border: const OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(15))),
              filled: true,
              focusedBorder: const OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: App_color.primaryColor,
                    width: 3,
                  )),
              enabledBorder: const OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                      style: BorderStyle.solid))),
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if(value.length == 0 && first == false){
              FocusScope.of(context).previousFocus();
            }
            if(last == true){
              String otpcode = '5555';
              String resultOtp = '${controller1.text}${controller2.text}${controller3.text}${controller4.text}';
              if(resultOtp == otpcode){
                Navigator.pushReplacement(context, PageTransition(child: const MainRegisterPage(), type: PageTransitionType.bottomToTop));
              }
              else if(resultOtp != otpcode) {
                setState(() {
                  txtError = 'b???n ???? nh???p sai m?? OTP r???i ><! nh???p l???i ??ii';
                });


              }
            }
          },
          textAlign: TextAlign.center,
          style: App_Style.primaryStyle().copyWith(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      );
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppbar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                child: Text(
                  'G???i qua tin nh???n\n ?????n s??? ??i???n tho???i ${convertObscure(widget.sdt)}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 15,
                      color: App_color.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSizedBox(first: true, last: false, controller: controller1,context: context),
                  buildSizedBox(first: false, last: false, controller: controller2,context: context),
                  buildSizedBox(first: false, last: false, controller: controller3,context: context),
                  buildSizedBox(first: false, last: true, controller: controller4,context: context),
                  // SizedBox(
                  //   height: 58,
                  //   width: 54,
                  //   child: TextField(
                  //     controller: controller4,
                  //     decoration: InputDecoration(
                  //         hoverColor: Colors.amber,
                  //         fillColor: Colors.grey.shade300,
                  //         focusColor: Colors.red,
                  //         border: const OutlineInputBorder(
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(15))),
                  //         filled: true,
                  //         focusedBorder: const OutlineInputBorder(
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(15)),
                  //             borderSide: BorderSide(
                  //               color: App_color.primaryColor,
                  //               width: 3,
                  //             )),
                  //         enabledBorder: const OutlineInputBorder(
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(15)),
                  //             borderSide: BorderSide(
                  //                 color: Colors.black,
                  //                 width: 1,
                  //                 style: BorderStyle.solid))),
                  //     onChanged: (value) {
                  //       if (value.length == 1) {
                  //         FocusScope.of(context).nextFocus();
                  //         String otpcode = '5555';
                  //         String resultOtp = '${controller1.text}${controller2.text}${controller3.text}${controller4.text}';
                  //         if(resultOtp == otpcode){
                  //           Navigator.pushReplacement(context, PageTransition(child: const MainRegisterPage(), type: PageTransitionType.bottomToTop));
                  //         }
                  //         else if(resultOtp != otpcode) {
                  //           setState(() {
                  //             txtError = 'b???n ???? nh???p sai m?? OTP r???i ><! nh???p l???i ??ii';
                  //           });
                  //
                  //
                  //         }
                  //       }
                  //     },
                  //     textAlign: TextAlign.center,
                  //     style: App_Style.primaryStyle().copyWith(
                  //         fontSize: 18,
                  //         color: Colors.black,
                  //         fontWeight: FontWeight.bold),
                  //     keyboardType: TextInputType.number,
                  //     inputFormatters: [
                  //       LengthLimitingTextInputFormatter(1),
                  //       FilteringTextInputFormatter.digitsOnly,
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Text(txtError!, style: TextStyle(
              color: Colors.red.withOpacity(0.7),
              fontSize: 16,
            ),),
            Row(
              mainAxisSize: MainAxisSize.min  ,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'G???i l???i m?? OTP',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      decoration: TextDecoration.underline,
                      letterSpacing: 0.6,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),

                Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_gbfwtkzw.json',
                    width: 60,
                    height: 60),
              ],
            ),
            const SizedBox(height: 15,),
            Text('Vui l??ng kh??ng ti???t l??? OTP c???a b???n cho b???t k??? ai k??? c??? nh??n vi??n NQPAY.',
            textAlign: TextAlign.start,
            style: App_Style.primaryStyle().copyWith(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),)
          ],
        ),
      ),
    );
  }

  AppBar getAppbar(context) {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: true,
      automaticallyImplyLeading: false,
      foregroundColor: Colors.white,
      elevation: 0,
      actions: [
        Padding(
          padding: EdgeInsets.only(top: 5, right: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'H???y',
              style:
                  TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
            ),
          ),
        )
      ],
      title: SizedBox(
        width: 200,
        child: Column(
          children: [
            const Text(
              'X??c nh???n OTP',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('* ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2)),
                Text('* ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2)),
                Text('* ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2)),
                Text('* ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

