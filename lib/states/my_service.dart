import 'package:flutter/material.dart';
import 'package:japea/utility/my_constant.dart';
import 'package:japea/utility/my_dialog.dart';
import 'package:japea/widgets/show_icon_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservice extends StatelessWidget {
  const Myservice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0, //เงาตรงขอบ appBar
        foregroundColor: MyConstant.dark, //สีicon ที่อยู่บน appBar
        backgroundColor: Colors.white,
        actions: [
          ShowIconButton(
            iconData: Icons.exit_to_app,
            pressFunc: () {
              MyDialog(context: context).normalDialog(
                  pressFunc: () async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.clear().then((value) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/authen', (route) => false);
                    });
                  },
                  label: 'Sign Out',
                  title: 'Sign Out?',
                  subTitle: 'Please Confirm SignOut');
            },
          ),
        ],
      ),
    );
  }
}
