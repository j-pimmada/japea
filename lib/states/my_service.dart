import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:japea/bodys/finish_job.dart';
import 'package:japea/bodys/non_finish_job.dart';
import 'package:japea/utility/my_constant.dart';
import 'package:japea/utility/my_dialog.dart';
import 'package:japea/widgets/show_icon_button.dart';
import 'package:japea/widgets/show_progress.dart';
import 'package:japea/widgets/show_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservice extends StatefulWidget {
  const Myservice({Key? key}) : super(key: key);

  @override
  State<Myservice> createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
  var titles = <String>[
    'Non Finish',
    'Finish',
  ];
  var iconDatas = <IconData>[
    Icons.close,
    Icons.done,
  ];
  var widgets = <Widget>[];
  var bottomNavigators = <BottomNavigationBarItem>[];
  int indexBodys = 0;

  @override
  void initState() {
    super.initState();
    createNavBar();
    processFindUserLogin();
  }

  Future<void> processFindUserLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var dataLogins = preferences.getStringList('data');
    print('dataLogin ==> $dataLogins');
    widgets.add(NonFinishJob(dataUserLogins: dataLogins!));
    widgets.add(FinishJob());
    setState(() {});
  }

  void createNavBar() {
    for (var i = 0; i < titles.length; i++) {
      bottomNavigators.add(
        BottomNavigationBarItem(
          label: titles[i],
          icon: Icon(
            iconDatas[i],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: newAppBar(context),
      body: widgets.isEmpty ? const ShowProgress() : widgets[indexBodys],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBodys,
        items: bottomNavigators,
        onTap: (value) {
          setState(() {
            indexBodys = value;
          });
        },
      ),
    );
  }

  AppBar newAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: ShowText(
        text: titles[indexBodys],
        textStyle: MyConstant().h2Style(),
      ),
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
    );
  }
}
