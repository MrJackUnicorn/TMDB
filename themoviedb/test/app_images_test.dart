import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_main1/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.logo).existsSync(), true);
  });
}
