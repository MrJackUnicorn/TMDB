import 'package:flutter/material.dart';

import 'package:flutter_application_main1/domain/api_client/api_client.dart';
import 'package:flutter_application_main1/domain/entity/serial_details_credits.dart';
import 'package:flutter_application_main1/library/Widgets/Inherited/provider.dart';

import 'package:flutter_application_main1/ui/navigation/main_navigation.dart';
import 'package:flutter_application_main1/ui/widgets/elements/radial_percent_widget.dart';

import 'package:flutter_application_main1/ui/widgets/serial_details/serial_details_model.dart';

class SerialDetailsMainInfoWidget extends StatelessWidget {
  const SerialDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopPosterWidget(),
        Padding(
          padding: EdgeInsets.all(20),
          child: _SerialNameWidget(),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: _ScoreWidget(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
          child: _SummeryWidget(),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: _OverViewWidget(),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: _DescriptionWidget(),
        ),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: _StaffWidget(),
        ),
      ],
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<SerialDetailsModel>(context);
    final overview = model?.serialDetails?.overview ?? 'loading...';
    return Text(
      overview,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _OverViewWidget extends StatelessWidget {
  const _OverViewWidget();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: 21,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<SerialDetailsModel>(context);
    final backdropPath = model?.serialDetails?.backdropPath;
    final posterPath = model?.serialDetails?.posterPath;
    return AspectRatio(
      aspectRatio: 390 / 219,
      child: Stack(
        children: [
          backdropPath != null
              ? Image.network(ApiClient.imageUrl(backdropPath))
              : const SizedBox.shrink(),
          Positioned(
            top: 20,
            left: 20,
            bottom: 20,
            child: posterPath != null
                ? Image.network(ApiClient.imageUrl(posterPath))
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}

class _SerialNameWidget extends StatelessWidget {
  const _SerialNameWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<SerialDetailsModel>(context);
    final serialName = model?.serialDetails?.originalName;
    var year = model?.serialDetails?.firstAirDate?.year.toString();
    if (year != null) {
      year = ' ($year)';
    }
    return Center(
      child: RichText(
        maxLines: 3,
        text: TextSpan(children: [
          TextSpan(
              text: serialName,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 21)),
          TextSpan(
              text: year,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400))
        ]),
      ),
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<SerialDetailsModel>(context);
    if (model == null) return const SizedBox.shrink();
    var texts = <String>[];
    final releaseDate = model.serialDetails?.firstAirDate;
    if (releaseDate != null) {
      texts.add(model.stringFromDate(releaseDate));
    }
    final productionCountries = model.serialDetails?.productionCountries;
    if (productionCountries == null) return const SizedBox.shrink();
    if (productionCountries.isNotEmpty) {
      texts.add('(${productionCountries.first.iso})');
    }

    // var runtime = model.serialDetails?.episodeRunTime;
    // if (runtime == null || runtime.isEmpty) {
    //   const SizedBox.shrink();
    // }
    // final duration = Duration(minutes: runtime);
    // final hours = duration.inHours;
    // final minutes = duration.inMinutes.remainder(60);
    // texts.add(', ${hours}h ${minutes}m, ');

    final genres = model.serialDetails?.genres;
    if (genres != null && genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genr in genres) {
        genresNames.add(genr.name);
      }
      texts.add(genresNames.join(', '));
    }

    return ColoredBox(
      color: const Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Text(
          texts.join(' '),
          maxLines: 3,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _StaffWidget extends StatelessWidget {
  const _StaffWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<SerialDetailsModel>(context);
    var crew = model?.serialDetails?.credits.crew;
    if (crew == null || crew.isEmpty) return const SizedBox.shrink();
    crew = crew.length > 4 ? crew.sublist(0, 4) : crew;
    var crewChunks = <List<Crew>>[];
    for (var i = 0; i < crew.length; i += 2) {
      crewChunks.add(
        crew.sublist(i, i + 2 > crew.length ? crew.length : i + 2),
      );
    }

    return Column(
      children: crewChunks
          .map(
            (chunk) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _StaffWidgetRow(crew: chunk),
            ),
          )
          .toList(),
    );
  }
}

class _StaffWidgetRow extends StatelessWidget {
  final List<Crew> crew;
  const _StaffWidgetRow({required this.crew});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: crew.map((crew) => StaffWidgetRowItem(crew: crew)).toList(),
    );
  }
}

class StaffWidgetRowItem extends StatelessWidget {
  final Crew crew;
  const StaffWidgetRowItem({
    super.key,
    required this.crew,
  });

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
    const jobTtittleStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(crew.name, style: nameStyle),
          Text(crew.job, style: jobTtittleStyle),
        ],
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget();

  @override
  Widget build(BuildContext context) {
    final serialDetails =
        NotifierProvider.watch<SerialDetailsModel>(context)?.serialDetails;
    var voteAverage = NotifierProvider.watch<SerialDetailsModel>(context)
            ?.serialDetails
            ?.voteAverage ??
        0;
    voteAverage = voteAverage * 10;
    final videos = serialDetails?.videos.results
        .where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos?.isNotEmpty == true ? videos?.first.key : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: RadialPercentWidget(
                percent: voteAverage / 100,
                fillColor: const Color.fromARGB(255, 10, 23, 25),
                lineColor: const Color.fromARGB(255, 37, 203, 103),
                freeColor: const Color.fromARGB(255, 25, 54, 31),
                lineWidth: 3,
                child: Text(
                  voteAverage.toStringAsFixed(0),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'User Score',
              style: TextStyle(fontSize: 17, color: Colors.blue),
            ),
          ],
        ),
        Container(
          height: 15,
          width: 1,
          color: Colors.grey,
        ),
        Row(
          children: [
            const Icon(
              Icons.play_arrow,
              color: Colors.blue,
            ),
            trailerKey != null
                ? TextButton(
                    onPressed: () => Navigator.of(context).pushNamed(
                        MainNavigationRouteNames.movieTrailer,
                        arguments: trailerKey),
                    child: const Text(
                      'Play Trailer',
                      style: TextStyle(fontSize: 17, color: Colors.blue),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
