import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour/ui/route/routes.dart';
import 'package:tour/ui/views/splashscreen.dart';
import 'package:tour/utils/const/appcolors.dart';
import 'package:tour/utils/const/appstrings.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await GetStorage.init();
  runApp( App());
}
class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    name: "tour",
    options: FirebaseOptions(
        apiKey: "AIzaSyCf3v5xoQjiakttEBJ6KwU5yUZ4eCL8l9U",
        appId: "1:501275711609:android:e2433183557233f2939ca8",
        messagingSenderId: "501275711609",
        projectId: "tour-1a768"

  )
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
        builder: (_,snapshot){
        if(snapshot.hasError){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.connectionState == ConnectionState.done){

          return MyApp();
        }
        return Center(
          child: CircularProgressIndicator(),
        );
        }
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428,926),
      builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false ,
          title: AppStrings.appName,
          theme: ThemeData(
            primarySwatch: Colors.blue,
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme.apply(),
              ),
            scaffoldBackgroundColor: AppColors.scaffoldColor,
          ),
          initialRoute: splash,
          getPages: getpages,
          home: const SplashScreen(),
        );
      },
    );
  }
}

