import 'package:flutter/material.dart';
import 'package:flutter_application_main1/domain/api_client/api_client.dart';
import 'package:flutter_application_main1/domain/entity/trending.dart';
import 'package:flutter_application_main1/domain/entity/trending_response.dart';
import 'package:flutter_application_main1/ui/navigation/main_navigation.dart';
import 'package:intl/intl.dart';

class TrendingModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _trendings = <Trendings>[];
  var _isLoadingInProgress = false;
  late int _currentPage = 0;
  late int _totalPage = 1;
  late String timeWindow = 'day';
  final String local = 'en-US';
  final String mediaType = 'movie';
  final DateFormat _dateFormat = DateFormat.yMMMMd();
  List<Trendings> get trendings => List.unmodifiable(_trendings);

  Future<TrendingResponse> _loadTrendings(
      String locale, String timeWindow, String mediaType, int nextPage) async {
    return await _apiClient.tranding(mediaType, timeWindow, locale, nextPage);
  }

  Future<void> loadNextPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final trendingsResponse =
          await _loadTrendings(local, timeWindow, mediaType, nextPage);
      _trendings.addAll(trendingsResponse.results);
      _currentPage = trendingsResponse.page;
      _totalPage = trendingsResponse.totalPages;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void onSerialTap(BuildContext context, int index) {
    final id = trendings[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';
}
