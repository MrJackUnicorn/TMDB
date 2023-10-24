import 'package:flutter/material.dart';
import 'package:flutter_application_main1/domain/api_client/api_client.dart';
import 'package:flutter_application_main1/library/Widgets/Inherited/provider.dart';

import 'package:flutter_application_main1/ui/widgets/movie_list/movie_list_model.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieListModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(top: 70),
          itemCount: model.movies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            model.showedMoviesAtIndex(index);
            final movie = model.movies[index];
            final posterPath = movie.posterPath;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        posterPath != null
                            ? Image.network(ApiClient.imageUrl(posterPath),
                                width: 95)
                            : const SizedBox.shrink(),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                movie.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                model.stringFromDate(movie.releaseDate),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text(
                                  movie.overview,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => model.onMovieTap(context, index)),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            onChanged: model.searchMovie,
            decoration: InputDecoration(
                labelText: "Search",
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white.withAlpha(235)),
          ),
        )
      ],
    );
  }
}
