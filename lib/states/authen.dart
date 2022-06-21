// 1. import
// importM (Material template for create app page)
import 'package:flutter/material.dart';
import 'package:japea/utility/my_constant.dart';
import 'package:japea/widgets/show_form.dart';
import 'package:japea/widgets/show_image.dart';
import 'package:japea/widgets/show_text.dart';

//2. override
// statelessW
//ตั้งชื่อคลาสขึ้นต้นด้วยตัวพิมพ์ใหญ่
class Authen extends StatelessWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              newLogo(boxConstraints),
              newTitle(),
              formUser(boxConstraints),
              Container(
                margin: const EdgeInsets.only(top: 16),
                height: 40,
                width: boxConstraints.maxWidth * 0.6,
                child: ShowForm(
                  hint: 'Password',
                  iconData: Icons.lock_outline,
                  changeFung: (String string) {},
                ),
              ),
            ],
          ),
        );
      }),
    ); //3.container > Scaffold
  }

  Container formUser(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: boxConstraints.maxWidth * 0.6,
      height: 40,
      child: ShowForm(
        hint: 'User: ',
        iconData: Icons.account_circle,
        changeFung: (String string) {},
      ),
    );
  }

  ShowText newTitle() {
    return ShowText(
      text: 'Login : ',
      textStyle: MyConstant().h1Style(),
    );
  }

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(width: boxConstraints.maxWidth * 0.25, child: ShowImage());
  }
}
