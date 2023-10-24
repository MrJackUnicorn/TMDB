import 'package:flutter/material.dart';

import 'package:flutter_application_main1/ui/widgets/serial_details/serial_details_main_screen_cast_widget.dart';
import 'package:flutter_application_main1/ui/widgets/serial_details/serial_details_model.dart';
import 'package:flutter_application_main1/ui/widgets/serial_details/serial_info.dart';

import 'package:flutter_application_main1/library/Widgets/Inherited/provider.dart';

class SerialDetailsWidget extends StatefulWidget {
  const SerialDetailsWidget({super.key});

  @override
  State<SerialDetailsWidget> createState() => _SerialDetailsWidgetState();
}

class _SerialDetailsWidgetState extends State<SerialDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    NotifierProvider.read<SerialDetailsModel>(context)?.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _TitleWidget(),
      ),
      body: const ColoredBox(
        color: Color.fromRGBO(24, 23, 27, 1.0),
        child: _BodyWidget(),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<SerialDetailsModel>(context);
    final title = model?.serialDetails?.originalName;
    return Text(title ?? 'Loading...');
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<SerialDetailsModel>(context);
    final serialDetails = model?.serialDetails;
    if (serialDetails == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView(
      children: const [
        SerialDetailsMainInfoWidget(),
        SizedBox(height: 30),
        SerialDetailsMainScreenCastWidget()
      ],
    );
  }
}
