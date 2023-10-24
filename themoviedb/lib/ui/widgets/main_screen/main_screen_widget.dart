import 'package:flutter/material.dart';
import 'package:flutter_application_main1/domain/data_providers/session_data_provider.dart';
import 'package:flutter_application_main1/library/Widgets/Inherited/provider.dart';
import 'package:flutter_application_main1/ui/widgets/news_list/free_to_watch_widget.dart';
import 'package:flutter_application_main1/ui/widgets/news_list/news_list_widget.dart';
import 'package:flutter_application_main1/ui/widgets/news_list/trending_widget.dart';

import 'package:flutter_application_main1/ui/widgets/serial_list/serial_list_model.dart';
import 'package:flutter_application_main1/ui/widgets/serial_list/serial_lits_widget.dart';
import 'package:flutter_application_main1/ui/widgets/movie_list/movie_list_model.dart';
import 'package:flutter_application_main1/ui/widgets/movie_list/movie_list_widget.dart';

import 'package:flutter_application_main1/ui/widgets/news_list/tranding_model.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  final movieListModel = MovieListModel();
  final serialListModel = SerialListModel();
  final trendingModel = TrendingModel();

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void initState() {
    super.initState();
    movieListModel.loadNextPage();
    serialListModel.loadNextPage();
    trendingModel.loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    // final model = NotifierProvider.read<MainScreenModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
        actions: [
          IconButton(
            onPressed: () => SessionDataProvider().setSessionId(null),
            icon: const Icon(
              Icons.logout_rounded,
            ),
          ),
        ],
      ),
      body: IndexedStack(index: _selectedTab, children: [
        NotifierProvider(
            create: () => trendingModel,
            isManagingModel: false,
            child: const NewsListWidget()),
        NotifierProvider(
            create: () => movieListModel,
            isManagingModel: false,
            child: const MovieListWidget()),
        NotifierProvider(
          create: () => serialListModel,
          child: const SerialListWidget(),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            label: 'News',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Movies',
            icon: Icon(Icons.movie),
          ),
          BottomNavigationBarItem(
            label: 'Serials',
            icon: Icon(Icons.tv),
          ),
        ],
        onTap: onSelectedTab,
      ),
    );
  }
}
