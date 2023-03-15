import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api.dart';
import '../models/story_items.dart';

final newsProvider = StateNotifierProvider<NewsProvider, List<storyitems>>(
        (ref) => NewsProvider());
List<storyitems> storylist = [];
late List idlist = [];

class NewsProvider extends StateNotifier<List<storyitems>> {
  NewsProvider() : super([]) {
    getTopStories();
  }
  Future<void> getTopStories() async {
    final dio = Dio();
    try {
      final response = await dio.get(
          Api.topStories);
      print(response);
      idlist = response.data;
      print(idlist.length);
      for (int i = 0; i < 20; i++) {
        int id = idlist[i];
        final news = await dio.get(
            "https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty");
        Map<String, dynamic> map = news.data;
        final data = storyitems.fromJson(map);
        storylist.add(data);
      }
      state = storylist;
    } on DioError catch (e) {
      print(e.error);
    }
  }
}