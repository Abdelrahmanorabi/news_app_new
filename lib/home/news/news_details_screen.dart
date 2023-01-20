import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/model/news_response.dart';
import '../../my_date_utils.dart';

/*======================> ASSIGNMENT<==================================*/

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'NEWS_DETAILS';

  /*=====================[Methods]========================*/
  // use package url_launcher
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  /*=====================================================*/

  @override
  Widget build(BuildContext context) {
    News news = ModalRoute.of(context)?.settings.arguments as News;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
          color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('  News Details'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(35),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network('${news.urlToImage}'),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: Text(
                  '${news.source!.name}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(121, 130, 139, 1),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '${news.title}',
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: Text(
                  MyDateUtils.formatDateNews(news.publishedAt!),
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      '${news.description}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'View Full Article',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              _launchInBrowser(Uri.parse(news.url ?? ''));
                            },
                            icon: const Icon(
                              Icons.play_arrow_sharp,
                              size: 20,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
