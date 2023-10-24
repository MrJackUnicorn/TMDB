import 'package:flutter/material.dart';
import 'package:flutter_application_main1/domain/api_client/api_client.dart';
import 'package:flutter_application_main1/library/Widgets/Inherited/provider.dart';

import 'package:flutter_application_main1/ui/widgets/news_list/dropdown_button_widget.dart';
import 'package:flutter_application_main1/ui/widgets/news_list/tranding_model.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TrendingModel>(context);
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
                child: Text(
              'Trending',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            )),
            DropDownButton(),
          ],
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 290,
          child: ListView.builder(
            itemCount: model?.trendings.length,
            itemExtent: 143,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              if (model == null) return const SizedBox.shrink();
              final trending = model.trendings[index];
              final title = trending.title;
              final releaseDate = trending.releaseDate;
              final posterPath = trending.posterPath;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2)),
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
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            posterPath != null
                                ? Image.network(
                                    ApiClient.imageUrl(posterPath),
                                  )
                                : const SizedBox.shrink(),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const SizedBox(height: 10),
                                  Text(
                                    model.stringFromDate(releaseDate),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => model.onSerialTap(context, index),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
