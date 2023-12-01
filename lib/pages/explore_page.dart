import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/helper/navigator_object.dart';
import 'package:scholar_shore/lists.dart';
import 'package:scholar_shore/pages/preferences.dart';
import 'package:scholar_shore/theme/theme_colors.dart';

import '../theme/dimensions.dart';



class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();

}
class Post{
  String img="";
  String providerName="";
  String title="";
  String description="";

  Post({
    required this.img,
    required this.providerName,
    required this.title,
    required this.description,
});
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool isSearching = false;

  get filterCategories => Categories.selectedCategoriesList;

  void toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      _searchController.clear();
      _searchFocusNode.requestFocus();
    });
  }

  int? _value = 1;

  String searchText="";

  List<Post> posts = [
    Post(img: MyImages.imgList[0], providerName: 'abc',title: "long title11",description: "description11"),
    Post(img: MyImages.imgList[1], providerName: 'bcd',title: "long title21",description: "description21"),
    Post(img: MyImages.imgList[2], providerName: 'cde',title: "long title12",description: "description12"),
    Post(img: MyImages.imgList[3], providerName: 'def',title: "long title32",description: "description32"),
    Post(img: MyImages.imgList[4], providerName: 'efg',title: "long title33",description: "description33"),
    Post(img: MyImages.imgList[5], providerName: 'fgh',title: "long title14",description: "description14"),
    Post(img: MyImages.imgList[6], providerName: 'ghi',title: "long title42",description: "description42"),
  ];


  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> schemeData={'schemeName': "hello world", 'description': "namasteIndia", 'image':'assets/images/carousel/code_screen1.jpg',};
    Iterable<Post> filteredPosts=posts.where((post) => post.providerName.toLowerCase().contains(searchText.toLowerCase())
    ||post.title.toLowerCase().contains(searchText.toLowerCase())
    ||post.description.toLowerCase().contains(searchText.toLowerCase())).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:8.0,right: 8,top: 8),
        child: CustomScrollView(
          slivers: <Widget>[
             SliverAppBar(
              foregroundColor:  Color(0xfffffbfe),
              surfaceTintColor: Color(0xfffffbfe),
              backgroundColor:  Color(0xfffffbfe),
              floating: true,
              pinned: false,
              expandedHeight: 80.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(top:10,bottom: 5,left: 10,right: 5),
                centerTitle: false,
                title: Padding(
                  padding: const EdgeInsets.only(left:4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      !isSearching
                          ? Text("Discover", style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),)
                          : Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          width: Dimensions.width30 * 4,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 0),
                            child: TextField(
                              focusNode: _searchFocusNode,
                              controller: _searchController,
                              onChanged: (text){
                                setState(() {
                                  searchText=text;
                                });
                              },
                              style: TextStyle(
                                fontSize: 24,
                                color: ThemeColors.fontColor2,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                hintText: "Search..",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    fontSize: 24,
                                    color: ThemeColors.fontColor2,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: isSearching ? 40.0 : 5.0), // Adjusted padding here
                        child: IconButton(
                          icon: Icon(
                            isSearching ? Icons.close : Icons.search,
                            color: Colors.black,
                            size: 22,
                          ),
                          onPressed: toggleSearch,
                        ),
                      )
                    ],
                  ),
                )
        ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 8),
                      child: Wrap(
                        spacing: 5.0,
                        children: List<Widget>.generate(
                          filterCategories.length,
                              (int index) {
                            return ChoiceChip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              label: Text(filterCategories[index]),
                              selected: _value == index,
                              onSelected: (bool selected) {
                                setState(() {
                                  _value = selected ? index : null;
                                });
                              },
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(delegate: SliverChildBuilderDelegate(addAutomaticKeepAlives: true,childCount: isSearching?filteredPosts.length:posts.length,(BuildContext context, int index) {
              return NavigatorObject(
                schemeData: schemeData,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10,top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0xFFe8e8e8),
                          offset: Offset(0, 5),
                        ),
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0xFFe8e8e8),
                          offset: Offset(0, -5),
                        ),
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0xFFe8e8e8),
                          offset: Offset(-5, 0),
                        ),
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0xFFe8e8e8),
                          offset: Offset(5, 0),
                        ),
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.white, // White shadow for the inside
                          offset: Offset(0, 0), // No offset to keep it inside
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 220,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(MyImages.imgList[index]),fit: BoxFit.cover),
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                          ),
                          height: 120,
                          width: double.maxFinite,

                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(isSearching?filteredPosts.elementAt(index).providerName:posts[index].providerName,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey[400],),),
                                Text(isSearching?filteredPosts.elementAt(index).title:posts[index].title,style: const TextStyle(fontSize: 26,fontWeight: FontWeight.w800,color: Colors.black,),),
                                Text(isSearching?filteredPosts.elementAt(index).description:posts[index].description,style:const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black,),),
                                //Align(alignment: Alignment.bottomRight,child: Text("For: thisGroup",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey[400],),),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            ),
            SliverToBoxAdapter(
                child: SizedBox(height: Dimensions.height30*2.5,))
          ],
        ),
      ),
    );
  }
}
