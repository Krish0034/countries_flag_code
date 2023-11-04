import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:countries_flag_code/countries_flag_code.dart';

void main() {
  test('adds one to input values', () {
     CountryFieldWidget(
      countrySelectionController: TextEditingController(), 
      phoneController: TextEditingController(),
    );
  
  });
}
