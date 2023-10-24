import 'package:flutter/material.dart';
import 'package:flutter_application_main1/domain/api_client/api_client.dart';

import 'package:flutter_application_main1/domain/entity/serial_details.dart';
import 'package:intl/intl.dart';

class SerialDetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();

  final int serialId;
  SerialDetails? _serialDetails;
  String _locale = '';
  late DateFormat _dateFormat;

  SerialDetails? get serialDetails => _serialDetails;

  SerialDetailsModel(this.serialId);

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(locale);
    await loadDetails();
  }

  Future<void> loadDetails() async {
    _serialDetails = await _apiClient.serialDetails(serialId, _locale);
    notifyListeners();
  }
}
