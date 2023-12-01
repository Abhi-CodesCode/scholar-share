import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/lists.dart';
import '../filter_controller.dart';

class Preferences extends StatefulWidget {
  Preferences({Key? key}) : super(key: key);

  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  final MyController myController = Get.find();

  get categoryList => Categories.categoryList;
  get selectedCategoryList => Categories.selectedCategoriesList;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              foregroundColor: Color(0xfffffbfe),
              surfaceTintColor: Color(0xfffffbfe),
              backgroundColor: Color(0xfffffbfe),
              floating: true,
              pinned: false,
              expandedHeight: 70.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(bottom: 14, top: 30, left: 14, right: 14),
                centerTitle: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Choose Your Interests",
                      style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    IconButton(onPressed: (){myController.updateFilterCategories(selectedCategoryList);Get.offAllNamed('/home');}, icon: Icon(Icons.check))
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 28, crossAxisSpacing: 20, crossAxisCount: 2),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    final category = categoryList[index];
                    final isSelected = selectedCategoryList.contains(category);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedCategoryList.remove(category);
                          } else {
                            selectedCategoryList.add(category);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:index%6==0?Colors.grey[100 * ((index+1) % 6)]:Colors.grey[100 * ((index) % 6)] ,
                          boxShadow: isSelected
                              ? [
                            BoxShadow(
                              color: Colors.black87, // Shadow color for selected preferences
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ]
                              : null,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(category,textAlign: TextAlign.center,),
                            if (isSelected)
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.black87, // Color of the check icon
                                  size: 70,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: categoryList.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 70,
              ),
            )
          ],
        ),
      ),
    );
  }
}
