import 'package:banking_application/Component/ButtonWidget.dart';
import 'package:banking_application/Pages/transfer_page.dart';
import 'package:banking_application/app_style/app_color/App_color.dart';
import 'package:banking_application/app_style/app_styles/App_style.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Component/FormInputSuffix_Widget.dart';
import 'ConfirmTransfer_page.dart';

class Detail_Transfer_page extends StatelessWidget {
  const Detail_Transfer_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: getAppbar(context),
      body: getBody(size, context),
    );
  }

  AppBar getAppbar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      foregroundColor: Colors.black,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
        ),
      ),
      title: Text(
        'Chuyển tiền',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
      ),
    );
  }

  getBody(Size size, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            height: size.height * 1 / 4 + 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26.withOpacity(0.15),
                  offset: const Offset(1, 2),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 8),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: const [
                              FormAccount_Widget(),
                              SoDuTaiKhoan_widget(
                                sodu: '250.000',
                              ),
                            ],
                          ),
                        ),
                        const Expanded(child: HuChiTieu_Container())
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.6,
                    indent: 15,
                    endIndent: 15,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const ToAccount_Widget(
                            AccountName: 'Nguyễn Hoàng Phúc'),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Row(
                            children: [
                              Text(
                                'Agribank',
                                style: App_Style.primaryStyle().copyWith(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 14),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '7200025325762',
                                style: App_Style.primaryStyle().copyWith(
                                    color: Colors.black.withOpacity(0.4),
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FormInputSuffix_Widget(
            size: size,
            lable: 'Số tiền',
            iconSuffix: Icons.edit,
          ),
          FormInputSuffix_Widget(
            size: size,
            lable: 'Lời nhắn (Nếu có) ',
            iconSuffix: Icons.edit,
          ),
          const SizedBox(
            height: 20,
          ),
          const Reminder_widget(
            icon: Icons.lightbulb,
            loiNhan:
                'Gửi lời nhắn thú vị hơn với tiếng Việt có dấu và biểu tượng cảm xúc. Chỉ thành viên NQpay xem được tin nhắn đặc biệt này.',
          ),
          const Spacer(),
          ButtonWidget(
            size: size,
            text: 'Xem lại',
            onTapp: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: const ConfirmTransfer_Page(),
                      type: PageTransitionType.leftToRight));
            },
          )
          // MaterialButton_widget(
          //     txtBtn: 'Xem lại',
          //     ontapp: () {
          //       Navigator.push(
          //           context,
          //           PageTransition(
          //               child: const ConfirmTransfer_Page(),
          //               type: PageTransitionType.leftToRight));
          //     })
        ],
      ),
    );
  }
}

class Reminder_widget extends StatelessWidget {
  final IconData icon;
  final String loiNhan;

  const Reminder_widget({Key? key, required this.icon, required this.loiNhan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: App_color.primaryColor),
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          loiNhan,
          overflow: TextOverflow.clip,
          style: App_Style.primaryStyle()
              .copyWith(fontSize: 12, color: Colors.black.withOpacity((0.25))),
        ))
      ],
    );
  }
}

class ToAccount_Widget extends StatelessWidget {
  final String AccountName;

  const ToAccount_Widget({
    Key? key,
    required this.AccountName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'ĐẾN ',
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.4)),
        ),
        Image.asset(
          'assets/images/user_static.png',
          width: 32,
          height: 32,
        ),
        Text(
          AccountName,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.7)),
        ),
      ],
    );
  }
}

class FormAccount_Widget extends StatelessWidget {
  const FormAccount_Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'TỪ ',
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.4)),
        ),
        Image.asset(
          'assets/images/user_static.png',
          width: 32,
          height: 32,
        ),
        Text(
          ' Tài khoản chính',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.7)),
        ),
      ],
    );
  }
}

class HuChiTieu_Container extends StatelessWidget {
  const HuChiTieu_Container({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey.withOpacity(0.15)),
      child: Row(
        children: [
          Image.asset(
            'assets/images/money_bag.png',
            width: 34,
            height: 34,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Hũ chi tiêu',
              overflow: TextOverflow.clip,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.4)),
            ),
          )
        ],
      ),
    );
  }
}

class SoDuTaiKhoan_widget extends StatelessWidget {
  final String sodu;

  const SoDuTaiKhoan_widget({
    Key? key,
    required this.sodu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.tealAccent.shade400, width: 0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 4,
              bottom: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/user_gif.gif',
                      width: 28,
                      height: 28,
                    ),
                    Text(
                      'Tài khoản chính',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.80)),
                    ),
                    Icon(
                      Icons.verified,
                      color: Colors.tealAccent.shade400,
                      size: 20,
                    )
                  ],
                ),
                Text(
                  sodu,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.3)),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
