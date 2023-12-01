import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:scholar_shore/pages/edit_profile_page.dart';
import 'package:scholar_shore/pages/explore_page.dart';
import 'package:scholar_shore/pages/home.dart';
import 'package:scholar_shore/pages/login.dart';
import 'package:scholar_shore/pages/scheme_detail_page.dart';
import 'package:scholar_shore/pages/preferences.dart';
import 'package:scholar_shore/pages/profile.dart';
import 'package:scholar_shore/pages/signup.dart';
import 'filter_controller.dart';

Map<String, dynamic> schemeData1={'schemeName': "hello world", 'description': "namasteIndia", 'image':'assets/images/carousel/code_screen1.jpg'};
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    theme: ThemeData(useMaterial3: true),
    initialBinding: BindingsBuilder(() {
      Get.put(MyController());
    }),
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(
        name: '/signup',
        page: () => const SignUpPage(),
      ),
      GetPage(
        name: '/preferences',
        page: () =>  Preferences(),
      ),
      GetPage(
        name: '/login',
        page: () => const LoginPage(),
      ),
      GetPage(
        name: '/home',
        page: () => const MyApp(),
      ),
      GetPage(
        name: '/schemeDetailPage',
        page: () => SchemeDetailPage(schemeData: schemeData1,),
      ),
    ],
    home: SignUpPage(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(length: 3, child: Scaffold(

      extendBody: true,

      body: TabBarView(
          children: [
            Home(),
            ExplorePage(),
            Profile()
          ]
      ),
      bottomNavigationBar:
      Container(
        padding: EdgeInsets.all(6),

        //decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xff131313),Colors.white],begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),color: const Color(0xffe4e4e6)),

        child: ClipRect(
          child: const TabBar(
            indicatorColor:Colors.transparent,
            labelColor: Color(0xff111111),
            tabs: [
              Tab(icon: Icon(Icons.home_filled),),
              Tab(icon: Icon(Icons.explore),),
              Tab(icon: Icon(Icons.person),)
            ],
          ),
        ),
      ),

    ));
  }
}
