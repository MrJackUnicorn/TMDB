import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_main1/domain/api_client/api_client.dart';
import 'package:flutter_application_main1/domain/entity/popular_serial_response.dart';

import 'package:flutter_application_main1/domain/entity/serial.dart';
import 'package:flutter_application_main1/ui/navigation/main_navigation.dart';
import 'package:intl/intl.dart';

class SerialListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _serials = <Serial>[];
  var _isLoadingInProgress = false;
  late int _currentPage = 0;
  late int _totalPage = 1;
  String? _searchQuery;
  Timer? searchDebounce;
  final DateFormat _dateFormat = DateFormat.yMMMMd();

  List<Serial> get serials => List.unmodifiable(_serials);

  Future<PopularSerialResponse> _loadSerials(
      int nextPage, String locale) async {
    final query = _searchQuery;
    if (query == null) {
      return await _apiClient.popularSerial(nextPage, locale);
    } else {
      return await _apiClient.searchSerial(nextPage, locale, query);
    }
  }

  void onSerialTap(BuildContext context, int index) {
    final id = serials[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.serialDetails, arguments: id);
  }

  Future<void> loadNextPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final serialsResponse = await _loadSerials(nextPage, 'en-US');
      _serials.addAll(serialsResponse.serials);
      _currentPage = serialsResponse.page;
      _totalPage = serialsResponse.totalPages;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 1;
    _serials.clear();
    await loadNextPage();
  }

  Future<void> searchSerial(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await _resetList();
    });
  }

  void showedSerialsAtIndex(int index) {
    if (index < _serials.length - 1) return;
    loadNextPage();
  }

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';
}
