
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';




Future<List<String>> getUserInterests() async {
  try {
    final snapshot = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
    if (snapshot.exists) {
      final data = snapshot.data();
      if (data != null && data.containsKey('interests')) {
        final List<String> interests = List<String>.from(data['interests']);
        return interests;
      }
    }

    return [];
  } catch (e) {
    print('Error getting user interests: $e');
    return [];
  }
}

Future<List<Map<String, dynamic>>> getTopPostsForCategory(String category) async {
  try {
    final snapshot = await FirebaseFirestore.instance.collection('interests').doc(category.toLowerCase()).collection(DateTime.now().year.toString()).limit(10).get();
    final posts = snapshot.docs.map((doc) => doc.data()).toList();
    return posts;
  } catch (e) {
    print('Error getting top posts for category $category: $e');
    return [];
  }
}


Future<List<Map<String, dynamic>>> getPostsFromFirebase() async {
  try {
    List<String> userInterests = await getUserInterests();
    List<Map<String, dynamic>> allPosts = [];
    for (String interest in userInterests) {
      List<Map<String, dynamic>> postsForCategory = await getTopPostsForCategory(interest);
      allPosts.addAll(postsForCategory);
    }
    return allPosts;
  } catch (e) {
    print('Error fetching posts: $e');
    return [];
  }
}


Future<List<Map<String, dynamic>>> get_post_based_on_filtered_interest({required filter_category_name}) async {
  try {
    List<Map<String, dynamic>> allPosts = [];

      final snapshot = await FirebaseFirestore.instance.collection('interests').doc(filter_category_name.toLowerCase()).collection(DateTime.now().year.toString()).limit(10).get();
      final posts = snapshot.docs.map((doc) => doc.data()).toList();
      allPosts.addAll(posts);

    return allPosts;
  } catch (e) {
    print('Error fetching posts: $e');
    return [];
  }
}