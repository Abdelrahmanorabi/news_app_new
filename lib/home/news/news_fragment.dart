 import 'package:flutter/material.dart';
import 'package:news_app_new/api/api_manager.dart';
import 'package:news_app_new/home/news/sources_tabs.dart';

import '../../api/model/sources_response.dart';
import '../category/categories.dart';

class NewsFragment extends StatelessWidget {
Category category;
NewsFragment({required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(12),
      child: Column(
        children: [
          FutureBuilder<SourcesResponse>(
            future: ApiManager.getNewsSources(category.id),
            builder: (buildContext, asyncSnapshot) {
              if (asyncSnapshot.hasError) {
                return Center(child: Text(asyncSnapshot.error.toString()),);
              }
              else if (asyncSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              else {
                var data = asyncSnapshot.data;
                if (data?.status  == 'error' ) {
                  // we got code and message from server
                  return Center(child: Text('${data?.message}'));
                }
                else{
                  List<Source>? sources = data?.sources;
                  return Expanded(
                      child: SourcesTabs(sources: sources!,)
                  );
                }

              }
            },
          )
        ],
      ),
    );
  }
}
