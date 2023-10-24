import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_main1/domain/api_client/api_client.dart';
import 'package:flutter_application_main1/domain/entity/popular_movie_response.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_main1/domain/entity/movie.dart';
import 'package:flutter_application_main1/ui/navigation/main_navigation.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movie>[];
  late int _currentPage = 0;
  late int _totalPage = 1;
  var _isLoadingInProgress = false;
  String? _searchQuery;
  Timer? searchDebounce;
  final DateFormat _dateFormat = DateFormat.yMMMMd();

  List<Movie> get movies => List.unmodifiable(_movies);

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 1;
    _movies.clear();
    await loadNextPage();
  }

  Future<PopularMovieResponse> _loadMovies(int nextPage, String locale) async {
    final query = _searchQuery;
    if (query == null) {
      return await _apiClient.popularMovie(nextPage, 'en-US');
    } else {
      return await _apiClient.searchMovie(nextPage, locale, query);
    }
  }

  Future<void> loadNextPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return;
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final moviesResponse = await _loadMovies(nextPage, 'en-US');
      _movies.addAll(moviesResponse.movies);
      _currentPage = moviesResponse.page;
      _totalPage = moviesResponse.totalPages;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }

  Future<void> searchMovie(String text) async {
    searchDebounce?.cancel();
    searchDebounce = Timer(const Duration(milliseconds: 300), () async {
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await _resetList();
    });
  }

  void showedMoviesAtIndex(int index) {
    if (index < _movies.length - 1) return;
    loadNextPage();
  }
}
