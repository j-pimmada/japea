// 1. import
// importM (Material template for create app page)
import 'package:flutter/material.dart';
import 'package:japea/utility/my_constant.dart';
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
              ShowText(
                text: 'Login : ',
                textStyle: MyConstant().h1Style(),
              ),
            ],
          ),
        );
      }),
    ); //3.container > Scaffold
  }

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(width: boxConstraints.maxWidth * 0.25, child: ShowImage());
  }
}
