import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wordpress_mobile/data/model/PostModel.dart';
import 'package:wordpress_mobile/data/repo/home_repo.dart';

import '../model/api_response.dart';

class HomeProvider with ChangeNotifier {
  final HomeRepository homeRepository;

  HomeProvider({required this.homeRepository});

  bool isLoading = false;

  List<PostModel> postModelList = [];

  getAllPosts() async {
    isLoading = true;
    notifyListeners();
    ApiResponse response = await homeRepository.getAllPosts();
    isLoading = false;
    notifyListeners();
    if (response.response.statusCode == 200) {
      response.response.data.forEach((element) {
        postModelList.add(PostModel.fromJson(element));
      });
      notifyListeners();
    } else {
      Fluttertoast.showToast(msg: response.response.statusMessage!);
    }
  }
}
