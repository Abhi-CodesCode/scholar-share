import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BugReportPage extends StatefulWidget {
  @override
  _BugReportPageState createState() => _BugReportPageState();
}

class _BugReportPageState extends State<BugReportPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController stepsController = TextEditingController();
  TextEditingController expectedController = TextEditingController();
  TextEditingController actualController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {Get.back();}, icon: Icon(Icons.arrow_back_rounded,color: Colors.black87,),),
        title: Text('Bug Report',style: TextStyle(color: Colors.black87),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Report a Bug',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Bug Title/Summary'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Bug Description'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: stepsController,
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Steps to Reproduce'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: expectedController,
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Expected Behavior'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: actualController,
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Actual Behavior'),
              ),
              SizedBox(height: 20),
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black87,foregroundColor: Colors.white.withOpacity(0.9)),
                onPressed: () {
                  // Add logic to submit bug report
                  // You may want to send this information to a server or handle it accordingly.
                  // You can also add validation logic before submitting.
                  _submitBugReport();
                },
                child: Text('Submit Bug Report'),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }

  void _submitBugReport() {
    // Add logic to handle bug report submission
    // You can use the information from the controllers to send a bug report.
    // For example, print the data for demonstration purposes.
    print('Bug Title: ${titleController.text}');
    print('Description: ${descriptionController.text}');
    print('Steps to Reproduce: ${stepsController.text}');
    print('Expected Behavior: ${expectedController.text}');
    print('Actual Behavior: ${actualController.text}');

    // Add logic to send the bug report to your server or handle it accordingly.
  }
}
