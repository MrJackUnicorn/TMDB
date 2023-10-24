import 'package:flutter/material.dart';
import 'package:flutter_application_main1/resources/resources.dart';
import 'package:flutter_application_main1/ui/widgets/news_list/dropdown_button_widget.dart';

class FreeToWatchWidget extends StatelessWidget {
  const FreeToWatchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
                child: Text(
              'Free To Watch',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            )),
            DropDownButton(),
          ],
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 290,
          child: ListView.builder(
            itemCount: 20,
            itemExtent: 143,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
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
                            const Image(image: AssetImage(AppImages.logo)),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('The Last of Us',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(height: 10),
                                  Text(
                                    'Jan 15, 2022',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
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
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
