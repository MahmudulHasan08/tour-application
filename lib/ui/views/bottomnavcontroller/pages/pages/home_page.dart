import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour/ui/route/routes.dart';
import 'package:tour/ui/widgets/nav_home_category.dart';

class HomePage extends StatelessWidget {
  final RxInt _currentIndex = 0.obs;
  final List courselImage = [
    "assets/images/cover-one.jpeg",
    "assets/images/cover-two.jpeg",
    "assets/images/cover-three.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Coursel slider
            AspectRatio(
              aspectRatio: 3.5,
              child: CarouselSlider(
                  items: courselImage.map((images) {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(images),
                        fit: BoxFit.cover,
                      )),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 0.7,
                    initialPage: _currentIndex.value,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (currentIndex, customPageChangedReason) {
                      _currentIndex.value = currentIndex;
                    },
                    scrollDirection: Axis.horizontal,
                  )),
            ),
            SizedBox(
              height: 6.h,
            ),
            //DotsIndicator
            Obx(
              () => DotsIndicator(
                dotsCount: courselImage.length,
                position: _currentIndex.toDouble(),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: 45.h,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(
                    width: 1.w,
                    color: Color(0xFF666565),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text("Search for your next tour"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            navHomeCategories(
              "For You",
              () => Get.toNamed(seeallscreen),
            ),
            SizedBox(
              height: 5.h,
            ),
            ForYou(),
            SizedBox(
              height: 20.h,
            ),
            navHomeCategories(
              "Recently Added",
              () => Get.toNamed(seeallscreen),
            ),
            SizedBox(
              height: 5.h,
            ),
            RecentlyAdded(),
            navHomeCategories(
              "Top Place",
              () => Get.toNamed(seeallscreen),
            ),
            SizedBox(
              height: 5.h,
            ),
            TopPlace(),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}

class ForYou extends StatelessWidget {
  const ForYou({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: InkWell(
                  onTap: () => Get.toNamed(detailsscreen),
                  child: Container(
                    height: 180.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7.r),
                            topRight: Radius.circular(7.r),
                          ),
                          child: Image.asset(
                            "assets/images/debtakhum.jpeg",
                            height: 115.h,
                            width: 100.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          "Title",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        Text(
                          "Cost",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class RecentlyAdded extends StatelessWidget {
  const RecentlyAdded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Container(
                  height: 180.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.r),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.r),
                          topRight: Radius.circular(7.r),
                        ),
                        child: Image.asset(
                          "assets/images/debtakhum.jpeg",
                          height: 115.h,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "Title",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      Text(
                        "Cost",
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class TopPlace extends StatelessWidget {
  const TopPlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81.h,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Container(
                  height: 81.h,
                  width: 81.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.r),
                    child: Image.asset(
                      "assets/images/debtakhum.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
