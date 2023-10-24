import 'package:flutter/material.dart';
import 'package:flutter_application_main1/domain/entity/movie_details.dart';
import 'package:flutter_application_main1/library/Widgets/Inherited/provider.dart';
import 'package:flutter_application_main1/ui/widgets/news_list/tranding_model.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => DropDownButtonState();
}

class DropDownButtonState extends State<DropDownButton> {
  var _dropdownValues = 'week';

  void dropdownCallback(String? selectedValue) {
    final model = NotifierProvider.watch<TrendingModel>(context);
    if (selectedValue is String) {
      setState(() {
        _dropdownValues = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<TrendingModel>(context);
    return DropdownButton(
      items: const [
        DropdownMenuItem(value: 'day', child: Text('day')),
        DropdownMenuItem(value: 'week', child: Text('week')),
      ],
      value: _dropdownValues,
      onChanged: dropdownCallback,
    );
  }
}
