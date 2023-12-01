import 'package:flutter/material.dart';
import 'package:scholar_shore/theme/theme_colors.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text("ScholarShore",
          style: TextStyle(
              fontSize: 28
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ThemeColors.primaryColor,),
                      height: 200,
                      width: 390,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics().parent,
                  itemBuilder: (BuildContext context,int index){

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 200,
                            width: 160,
                            decoration: BoxDecoration(color: ThemeColors.accentColor,borderRadius: BorderRadius.circular(20)),
                          ),
                          Container(
                            height: 200,
                            width: 190,
                            decoration: BoxDecoration(color: ThemeColors.accentColor,borderRadius: BorderRadius.circular(20)),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
