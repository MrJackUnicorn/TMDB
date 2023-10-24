import 'package:flutter/material.dart';
import 'package:flutter_application_main1/domain/api_client/api_client.dart';
import 'package:flutter_application_main1/ui/widgets/serial_list/serial_list_model.dart';
import 'package:flutter_application_main1/library/Widgets/Inherited/provider.dart';

class SerialListWidget extends StatelessWidget {
  const SerialListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<SerialListModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70),
          itemCount: model.serials.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            model.showedSerialsAtIndex(index);
            final serial = model.serials[index];
            final title = serial.name;
            final posterPath = serial.posterPath;
            final firstAirDate = serial.firstAirDate;
            final overview = serial.overview;
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
                            offset: const Offset(0, 2)),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        posterPath != null
                            ? Image.network(ApiClient.imageUrl(posterPath),
                                width: 95)
                            : const SizedBox.shrink(),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                model.stringFromDate(firstAirDate),
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                overview,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
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
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            onChanged: model.searchSerial,
            decoration: InputDecoration(
                labelText: 'Search',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white.withAlpha(235)),
          ),
        )
      ],
    );
  }
}
