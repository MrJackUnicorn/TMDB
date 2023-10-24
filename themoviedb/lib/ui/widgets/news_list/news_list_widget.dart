import 'package:flutter/material.dart';
import 'package:flutter_application_main1/ui/widgets/news_list/free_to_watch_widget.dart';

import 'package:flutter_application_main1/ui/widgets/news_list/trending_widget.dart';

class NewsListWidget extends StatefulWidget {
  const NewsListWidget({super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(children: const [
        TrendingWidget(),
        SizedBox(height: 30),
        FreeToWatchWidget(),
      ]),
    );
  }
}
