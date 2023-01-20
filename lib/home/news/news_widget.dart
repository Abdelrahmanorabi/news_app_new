import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
 import 'package:news_app_new/home/news/news_details_screen.dart';

import '../../api/model/news_response.dart';
import '../../my_date_utils.dart';


class NewsWidget extends StatelessWidget {
  News news;

  NewsWidget(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetailsScreen.routeName,arguments: news);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20) ,
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 230,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              news.author ?? '',
              style: const TextStyle(
                color: Color(0xFF79828B),
                fontSize: 12,
              ),
            ),
            Text(
              news.title ?? '',
              style: const TextStyle(
                  color: Color(0xFF42505C),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Text(
               MyDateUtils.formatDateNews(news.publishedAt?? '') ,
              style: const TextStyle(
                color: Color(0xFF79828B),
                fontSize: 12,
              ),
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
    );
  }
}
