import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/pages/explore_page.dart';
import 'package:scholar_shore/pages/home.dart';
import 'package:scholar_shore/pages/login.dart';
import 'package:scholar_shore/pages/scheme_detail_page.dart';
import 'package:scholar_shore/pages/preferences.dart';
import 'package:scholar_shore/pages/profile.dart';
import 'package:scholar_shore/pages/signup.dart';
import 'filter_controller.dart';

Map<String, dynamic> schemeData1={'title': "hello world", 'description': "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sodales quam leo, eu consectetur enim imperdiet vel. Curabitur imperdiet ante vel blandit consectetur. Nunc pulvinar nulla eu enim gravida mollis. Proin ullamcorper turpis eget urna semper hendrerit. Sed dapibus tincidunt odio, quis pellentesque sem dictum ut. Nullam sed lectus nec nunc varius dignissim at et odio. Morbi condimentum diam nec tortor viverra iaculis. Quisque lacinia auctor justo a cursus.Donec non varius magna. Praesent vel odio nec neque suscipit lobortis quis quis erat. Mauris id orci ligula. Nam vitae arcu facilisis, varius nisi non, tincidunt lorem. Suspendisse potenti. Aliquam erat volutpat. Nullam sit amet tristique lacus. Aenean et lectus ut magna posuere efficitur. Phasellus ac ex quis dolor varius luctus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla felis lectus, fringilla id porta non, laoreet at nisl.Sed gravida est vel massa faucibus, aliquam auctor eros pretium. Aliquam commodo est metus. In quis felis finibus tortor vulputate vestibulum sed nec lacus. Nullam non erat elementum, interdum risus id, egestas felis. Nam sollicitudin consequat ex, non tincidunt nulla maximus at. Fusce porttitor eros enim, at pharetra justo facilisis tempor. Donec nec pharetra odio. Duis urna nisi, ullamcorper a turpis a, laoreet tempor lacus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vulputate purus turpis, in ullamcorper sem imperdiet molestie. Ut ultricies massa id lorem tempor iaculis. Morbi at sem molestie, placerat ligula eu, aliquet mauris. Pellentesque mattis pulvinar sodales. Maecenas ultrices suscipit placerat. Aenean fringilla varius sagittis. Sed id libero eu dui laoreet egestas. Quisque et mauris cursus, iaculis quam sed, efficitur enim. Cras sagittis risus sit amet dapibus tincidunt. Morbi accumsan consectetur leo, in gravida tellus vestibulum porttitor. Vestibulum arcu sapien, convallis vitae augue sed, eleifend semper velit. Phasellus erat justo, aliquet at vestibulum sit amet, finibus sit amet felis. Ut gravida magna eget neque tincidunt, ut auctor eros suscipit.Pellentesque ullamcorper venenatis eros non rutrum. Proin feugiat finibus ultrices. Donec sollicitudin posuere massa sit amet cursus. Cras lacus sapien, pretium eu ultrices nec, interdum nec nisl. Nunc varius varius ullamcorper. Donec vehicula lectus ut lacinia fermentum. Aliquam faucibus massa et massa blandit maximus. Aliquam at nunc eleifend, consectetur massa et, fermentum justo. Mauris vitae ornare urna. Suspendisse potenti. Integer congue est nec sollicitudin faucibus. Vestibulum bibendum ligula non posuere varius. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus tincidunt risus a suscipit porta. Suspendisse nisl turpis, fringilla sit amet laoreet sit amet, bibendum vitae arcu. Mauris justo elit, tempus sed rutrum feugiat, vehicula vel sem.", 'image':'assets/images/carousel/code_screen1.jpg'};
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
        name: '/',
        page: () => const MyApp(),
      ),


      GetPage(
        name: '/schemeDetailPage',
        page: () => SchemeDetailPage(schemeData: schemeData1,),
      ),
    ],
    home: SignUpPage(),
  ));
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
