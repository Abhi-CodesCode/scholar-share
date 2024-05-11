import 'package:flutter/material.dart';
import 'package:scholar_shore/theme/dimensions.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});

  Map<String,String> aboutUs={
    'mission':"At the core of ScholarShare's mission is the commitment to support students in unlocking their full potential. We strive to create an inclusive and dynamic space that fosters academic excellence, career development, and personal growth.",
    'aboutUs':"Welcome to ScholarShare – a dedicated platform committed to empowering students on their academic and professional journey. At ScholarShare, we believe in the potential of every student and aim to provide a holistic resource hub for growth, learning, and discovery.",
    'whatWeOffer1':"Discover a myriad of academic competitions, internships, scholarships, and events tailored to your interests and aspirations.",
    'whatWeOffer2':"Access a rich library of articles, tutorials, and guides covering diverse topics to supplement your academic journey.",
    'whatWeOffer3':"Connect with a vibrant community of like-minded individuals, sharing insights, experiences, and fostering a collaborative learning environment.",
    'whatWeOffer4':"Tailor your journey with personalized dashboards, notifications, and curated content to match your unique needs and goals.",
    'joinUs':"Join ScholarShare for a journey of learning, connection, and success. We're here to support and empower you, whether you're a student, educator, or professional. Let's redefine the way we learn, grow, and succeed together.",
    'mail':"abhi.codescode@gmail.com / chensukhgaur444@gmail.com",
    'whatsapp':"+91 89488-02660 / 6367718701",
  };

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 28.0,left: 20,right: 20,bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.height40,),
                Text("About Us",style: TextStyle(color: Colors.black87,fontSize: 40,fontWeight: FontWeight.w700),),
                SizedBox(height: Dimensions.width6,),
                Text(aboutUs['aboutUs']!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),

                SizedBox(height: Dimensions.height30,),

                Text("Our Mission",style: TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.w700),),
                SizedBox(height: Dimensions.width6,),
                Text(aboutUs['mission']!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),

                SizedBox(height: Dimensions.height30,),

                Text("What We Offer",style: TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.w700),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.height10,),
                      Text("Opportunities Galore",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                      SizedBox(height: Dimensions.height10,),
                      Text(aboutUs['whatWeOffer1']!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                      SizedBox(height: Dimensions.height20,),

                      Text("Resource Hub",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                      SizedBox(height: Dimensions.height10,),
                      Text(aboutUs['whatWeOffer2']!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                      SizedBox(height: Dimensions.height20,),

                      Text("Community Engagement",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                      SizedBox(height: Dimensions.height10,),
                      Text(aboutUs['whatWeOffer3']!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                      SizedBox(height: Dimensions.height20,),

                      Text("Personalized Experience",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                      SizedBox(height: Dimensions.height10,),
                      Text(aboutUs['whatWeOffer4']!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),

                SizedBox(height: Dimensions.height20,),

                Text("A Journey of Opportunities",style: TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.w700),),
                SizedBox(height: Dimensions.width6,),
                Text(aboutUs['joinUs']!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),

                SizedBox(height: Dimensions.height30,),

                Text("Contact Us",style: TextStyle(color: Colors.black87,fontSize: 30,fontWeight: FontWeight.w700),),
                SizedBox(height: Dimensions.width6,),

                Text("Work Mail Address",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                Text(aboutUs['mail']!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                Text("Whatsapp Number",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                Text(aboutUs['whatsapp']!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                SizedBox(height: Dimensions.height40,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
