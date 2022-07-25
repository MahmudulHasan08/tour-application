import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour/ui/views/bottomnavcontroller/pages/pages/navcontroller.dart';
import 'package:tour/ui/views/drawer_screen.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({Key? key}) : super(key: key);
  Future _exitDialouge(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are You Sure To Close This App?"),
            content: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("No"),
                ),
                SizedBox(
                  width: 20.w,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Yes"),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _exitDialouge(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            NavController(),
          ],
        ),
      ),
    );
  }
}
