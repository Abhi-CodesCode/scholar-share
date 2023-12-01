import 'package:get/get.dart';

class MyController extends GetxController {
  RxList<String> filterCategories = <String>[].obs;

  void updateFilterCategories(List<String> newCategories) {
    filterCategories.clear();
    filterCategories.addAll(newCategories);
  }
}