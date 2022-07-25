import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour/ui/views/bottomnavcontroller/pages/pages/addpage.dart';
import 'package:tour/ui/views/bottomnavcontroller/pages/pages/favouritepage.dart';
import 'package:tour/ui/views/bottomnavcontroller/pages/pages/home_page.dart';

class NavController extends StatelessWidget {
  RxInt currenetIndex = 0.obs;
  RxBool drawer = false.obs;
  List pages = [HomePage(), AddPage(), FavouritePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
          duration: Duration(milliseconds: 400),
          top: drawer.value == false ? 0 : 100.h,
          bottom: drawer.value == false ? 0 : 100.h,
          left: drawer.value == false ? 0 : 200.w,
          right: drawer.value == false ? 0 : -100.w,
          child: Container(
            decoration: BoxDecoration(),
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Shelter",
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                elevation: 0.0,
                backgroundColor: Colors.white,
                leading: drawer.value == false
                    ? IconButton(
                        onPressed: () {
                          drawer.value = true;
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          drawer.value = false;
                        },
                        icon: Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: currenetIndex.value,
                  onTap: (value) => currenetIndex.value = value,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add_outlined), label: "Add"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite_outline), label: "Favourite"),
                  ]),
              body: pages[currenetIndex.value],
            ),
          ),
        ));
  }
}
