import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/post_model.dart';
import '../services/home_service.dart';

class HomeProvider extends ChangeNotifier {
  final HomeService _service = HomeService();

  List<PostModel> posts = [];

  bool isLoading = false;

  bool isPaginationLoading = false;

  int offset = 0;

  bool hasMore = true;

  Future<void> getPosts({bool pagination = false}) async {
    if (pagination) {
      isPaginationLoading = true;
    } else {
      isLoading = true;
    }

    notifyListeners();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = prefs.getString("token") ?? "";

      final response = await _service.getPosts(token: token, offset: offset);

      List data = response.data["data"];

      List<PostModel> fetched = data.map((e) => PostModel.fromJson(e)).toList();

      if (fetched.isEmpty) {
        hasMore = false;
      } else {
        posts.addAll(fetched);
        offset += 10;
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    isLoading = false;

    isPaginationLoading = false;

    notifyListeners();
  }

  void toggleLike(int index) {
    posts[index].isLiked = !posts[index].isLiked;

    notifyListeners();
  }
}
