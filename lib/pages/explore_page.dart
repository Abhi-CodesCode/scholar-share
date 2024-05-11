import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_shore/functions/home_page_functions/get_user_interests.dart';
import 'package:scholar_shore/helper/navigator_object.dart';
import 'package:scholar_shore/lists.dart';
import 'package:scholar_shore/pages/preferences.dart';
import 'package:scholar_shore/theme/theme_colors.dart';

import '../constants/explore_page_searchbar_constant.dart';
import '../theme/dimensions.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class Post {
  String img = "";
  String providerName = "";
  String title = "";
  String description = "";

  Post({
    required this.img,
    required this.providerName,
    required this.title,
    required this.description,
  });
}

class _ExplorePageState extends State<ExplorePage> {
  List<Post>? posts;
  List<Map<String, dynamic>>? data;
  late final List<String> filterCategories;


  @override
  void initState() {
    super.initState();
    getUserInterests().then((categories) {
      if(categories.isNotEmpty && categories!=null){
        filterCategories = categories;
        fetchPosts(category_name: filterCategories![0]);
      }
    });
  }


  Future<void> fetchPosts({required category_name}) async {
    List<String> userInterests = await getUserInterests();
    if (userInterests.isNotEmpty) {
      String filterCategoryName = category_name;
      data = await get_post_based_on_filtered_interest(filter_category_name: filterCategoryName);
      setState(() {
        posts = data!
            .map((item) => Post(
          img: item["post_image"],
          providerName: item["organization_name"],
          title: item["title"],
          description: item["description"],
        ))
            .toList();
      });
    }
  }



      final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool isSearching = false;



  void toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      _searchController.clear();
      _searchFocusNode.requestFocus();
    });
  }

  int? _value = 1;

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    if (posts == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    Iterable<Post> filteredPosts = posts!.where((post) =>
    post.providerName.toLowerCase().contains(searchText.toLowerCase()) ||
        post.title.toLowerCase().contains(searchText.toLowerCase()) ||
        post.description.toLowerCase().contains(searchText.toLowerCase()));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 2.0, right: 8, top: 8),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              foregroundColor: Color(0xfffffbfe),
              surfaceTintColor: Color(0xfffffbfe),
              backgroundColor: Color(0xfffffbfe),
              floating: true,
              pinned: false,
              expandedHeight: 80.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding:
                EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 5),
                centerTitle: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // if (!isSearching)
                    //   IconButton(
                    //     onPressed: () {
                    //       Get.back();
                    //     },
                    //     icon: Icon(Icons.arrow_back_rounded),
                    //   ),

                    !isSearching
                        ? Text(
                      "Discover",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                        : Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: SizedBox(
                        width: Dimensions.width30 * 4,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 20.0, bottom: 0),
                          child: TextField(
                            autofocus: true,
                            focusNode: _searchFocusNode,
                            controller: _searchController,
                            onChanged: (text) {
                              setState(() {
                                searchText = text;
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: isSearching ? 40.0 : 5.0),
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
                                  _value = selected ? index : 0 ;

                                });
                                fetchPosts(category_name: filterCategories[index]);
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return NavigatorObject(
                    schemeData: data![index], // Assuming data is a List<Map<String, dynamic>>
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
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
                              height: Dimensions.exploreItemHeight,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: Image.network(posts![index].img).image,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                            ),
                            Container(

                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              width: double.maxFinite,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      isSearching
                                          ? filteredPosts.elementAt(index).providerName
                                          : posts![index].providerName,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    Text(
                                      isSearching
                                          ? filteredPosts.elementAt(index).title
                                          : posts![index].title,
                                      style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      isSearching
                                          ? filteredPosts.elementAt(index).description
                                          : posts![index].description.length>200?posts![index].description.substring(0,(posts![index].description.length/2).toInt()):posts![index].description,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,

                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: isSearching ? filteredPosts.length : posts!.length,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: Dimensions.height30 * 2.5),
            )
          ],
        ),
      ),
    );
  }
}
