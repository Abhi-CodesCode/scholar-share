import 'package:flutter/material.dart';

import '../widgets/app_icons.dart';

class WorkingOnPage extends StatelessWidget {
  const WorkingOnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: GestureDetector(
          child: Icon(Icons.arrow_back,color: Colors.black,),
          onTap: () {
            Navigator.of(context).pop();
            },
          ),

        ),
      body: Center(
        child: 
        Text("Work to be done",style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        ),
      ),
    );
  }
}
