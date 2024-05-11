
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../functions/auth/login_signup_function.dart';
import '../functions/mod_page_functions/publish_post.dart';
import '../functions/mod_page_functions/upload_image_function.dart';
import '../main.dart';

class ModPageController extends GetxController {
  List<String> interestsList = [
    'Hackathons',
    'Competitions',
    'Student Offers',
    'State Government Jobs',
    'Central Government Jobs',
    'Free online courses',
    'Free skills courses',
    'Study Materials',
    'Gate study materials',
    'Entrepreneurship study materials',
    'Webinars and Seminars',
    'Job Listings',
    'Scholarships',
    'Events and Workshops',
    'Study Abroad Programs',
    'Volunteer Opportunities',
    'Research Opportunities',
    'Part-Time Jobs',
    'Career Services',
    'Campus News and Updates',
    'Government Schemes',
    // Add your new categories here
    'Internships',
    'Mentorship Programs',
    'Exchange Programs',
    'Startup Incubators and Accelerators',
    'Online Courses and Certifications',
    'Conferences',
    'Grants and Funding Opportunities',
    'Academic Contests',
    'Coding Challenges',
    'Language Exchange Programs',
    'Cultural Exchange Programs',
    'Community Service Projects',
    'Leadership Programs',
    'Study Groups',
    'Career Fairs',
    'Networking Events',
    'Professional Development Workshops',
    'Student Discounts',
    'Health and Wellness Programs',
    'Sports and Recreation Programs',
  ];

  var filteredList = ''.obs; // Using GetX observable for reactivity
  late File? imageFile = null;
  String imagePathOnFirebase = '';

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController criteriaController;
  late TextEditingController linkController;
  late TextEditingController dateController;
  late TextEditingController organizationNameController;

  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    criteriaController = TextEditingController();
    linkController = TextEditingController();
    dateController = TextEditingController();
    organizationNameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    criteriaController.dispose();
    linkController.dispose();
    dateController.dispose();
    organizationNameController.dispose();
    super.onClose();
  }
}
class ModPage extends StatelessWidget {
  final ModPageController modPageController = Get.put(ModPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Home"),
              onTap: () {
                Get.off(MyApp());
              },
            ),
            ListTile(
              title: Text("Logout"),
              onTap: () {
                logout();
                Get.offAllNamed('/login');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Mod"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async {
              final imagePath = await uploadImage(modPageController.imageFile! as File);
              if (imagePath.isNotEmpty) {
                publish_post(
                  image: imagePath,
                  title: modPageController.titleController.text,
                  description: modPageController.descriptionController.text,
                  criteria: modPageController.criteriaController.text,
                  link: modPageController.linkController.text,
                  category: modPageController.filteredList.value,
                  organization_name: modPageController.organizationNameController.text,
                );
              } else {
                Get.snackbar("Error", "Please select an image");
              }
            },
            child: Text("Publish"),
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "With Great Power Comes Great Responsibility",
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TextField(
              onChanged: (value) {},
              decoration: InputDecoration(hintText: "Organization name"),
              controller: modPageController.organizationNameController,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Title"),
              controller: modPageController.titleController,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Description"),
              controller: modPageController.descriptionController,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Criteria"),
              controller: modPageController.criteriaController,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Link"),
              controller: modPageController.linkController,
            ),
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2025),
                );
                if (pickedDate != null) {
                  modPageController.dateController.text = pickedDate.toString();
                }
              },
              child: TextField(
                decoration: InputDecoration(hintText: "Add Last date: ()"),
                enabled: false,
                controller: modPageController.dateController,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final imagePicker = ImagePicker();
                final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  modPageController.imageFile = File(pickedFile.path);
                } else {
                  Get.snackbar("Error", "Image selection cancelled.");
                }
              },
              child: Text("Add Image"),
            ),
            if (modPageController.imageFile != null) Image.file(modPageController.imageFile!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                direction: Axis.horizontal,
                children: modPageController.interestsList.map((interest) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: FilterChip(
                      label: Text(interest),
                      selected: modPageController.filteredList.value == interest,
                      onSelected: (bool selected) {
                        if(selected){
                          print("selected");

                          modPageController.filteredList.value = interest;
                          Get.forceAppUpdate();
                          //print(modPageController.filteredList.value + "was selected");

                        }
                        else{
                          Get.forceAppUpdate();
                          modPageController.filteredList.value = '';
                          Get.appUpdate();
                        }

                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
