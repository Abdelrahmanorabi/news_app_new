import 'package:flutter/material.dart';
import 'package:news_app_new/api/api_manager.dart';
import '../../api/model/news_response.dart';
import '../../api/model/sources_response.dart';
 import 'news_widget.dart';

class NewsList extends StatelessWidget {
  Source source;

  NewsList({required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<NewsResponse>(
          future: ApiManager.getNewsBySourceId(sourceId:source.id!),
          builder: (buildContext, asyncSnapshot) {
            if (asyncSnapshot.hasError) {
              return Center(
                child: Text(asyncSnapshot.error.toString()),
              );
            }
            else if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            else {
              var data = asyncSnapshot.data;
              if (data?.status == 'error') {
                // we got code and message from server
                return Center(child: Text('${data?.message}'));
              }
              else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: data?.newsList?.length ?? 0,
                    itemBuilder: (buildContext, index) {
                      return NewsWidget((data?.newsList![index])!);
                    },
                  ),
                );
              }
            }
          }),
    );
  }
}
