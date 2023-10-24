import 'package:flutter/material.dart';
import 'package:flutter_application_main1/domain/api_client/api_client.dart';

import 'package:flutter_application_main1/library/Widgets/Inherited/provider.dart';
import 'package:flutter_application_main1/ui/widgets/movie_details/movie_details_model.dart';

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ColoredBox(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Series Cast',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 300,
              child: Scrollbar(
                child: _ActorListWidget(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: TextButton(
                onPressed: () {},
                child: const Text('Full Cast & Crew'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ActorListWidget extends StatelessWidget {
  const _ActorListWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<MovieDetailsModel>(context);
    var cast = model?.movieDetails?.credits.cast;
    if (cast == null || cast.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
      itemCount: cast.length,
      itemExtent: 143,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _ActorListItemWidget(actorIndex: index);
      },
    );
  }
}

class _ActorListItemWidget extends StatelessWidget {
  final int actorIndex;
  const _ActorListItemWidget({required this.actorIndex});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<MovieDetailsModel>(context);
    var actor = model!.movieDetails!.credits.cast[actorIndex];
    final actorPhoto = actor.profilePath;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
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
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              actorPhoto != null
                  ? Image.network(ApiClient.imageUrl(actorPhoto))
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(actor.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 5),
                    Text(
                      actor.character,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
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
