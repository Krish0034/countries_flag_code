import 'dart:convert';
import 'dart:developer';
import 'package:countries_flag_code/src/country_list_response/country.dart';
import 'package:countries_flag_code/src/country_list_response/country_list_response.dart';
import 'package:countries_flag_code/src/utils/colors_file.dart';
import 'package:countries_flag_code/src/utils/common_assets.dart';
import 'package:countries_flag_code/src/utils/common_strings.dart';
import 'package:countries_flag_code/src/utils/country_bottomsheet.dart';
import 'package:countries_flag_code/src/utils/custom_widgets/hw_space.dart';
import 'package:countries_flag_code/src/utils/custom_widgets/text_widget.dart';
import 'package:countries_flag_code/src/utils/shared_prefereces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CountryFieldWidget extends StatefulWidget {
   CountryFieldWidget({
    required this.countrySelectionController,
    required this.phoneController,
    this.countryListResponse,
    this.isErroAvialble = false,
    this.validNumber = false,
    this.initialSelectedCountryCode = 'IN',
    this.initialselectedCountryFlag = '🇮🇳',
    this.initialselectedCountryDialCode = '+91',
    this.initialselectedCountryFlagImage = CommonAsset.initialFlagImage,
    Key? key,
  }) : super(key: key);

  
  bool? isErroAvialble = false;
  bool? validNumber = false;
  late final TextEditingController countrySelectionController;
  late final TextEditingController phoneController;
  List<Country>? countryListResponse;
  String? initialSelectedCountryCode;
  String? initialselectedCountryFlag;
  String? initialselectedCountryDialCode;
  String? initialselectedCountryFlagImage;
  @override
  State<CountryFieldWidget> createState() => _CountryFieldWidgetState();
}

class _CountryFieldWidgetState extends State<CountryFieldWidget> {
  @override
  void initState() {
    if(widget.countryListResponse!.isEmpty) {
      readJson();
    }
    super.initState();
  }

  /// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/country/country.json');
    final countryList = CountryListResponse.fromJson(json.decode(response));
    print("country list is the ${countryList}");
    widget.countryListResponse = countryList.country ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: ColorFiles.deActiveIndicator.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: ColorFiles.appBarText.withOpacity(0.8),
          width: 1.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              CountryBottomSheet.countryBottomSheet(
                      context, widget.countryListResponse!)
                  .then((value) => setState(() {
                        print("country in then method is ${value.toString()}");
                        var e = value as Country;
                        Preference.setString(
                            Preference.countryCode, e.code.toString());
                        Preference.setString(
                            Preference.countryFlag, e.emoji.toString());
                        Preference.setString(
                            Preference.countryDialCode, e.dialCode.toString());
                        widget.initialSelectedCountryCode = e.code.toString();
                        widget.initialselectedCountryFlag = e.emoji.toString();
                        widget.initialselectedCountryDialCode = e.dialCode.toString();
                        widget.initialselectedCountryDialCode = e.dialCode.toString();
                        widget.initialselectedCountryFlagImage = e.image.toString();
                        log("country on tap initialcode ${widget.initialSelectedCountryCode}");
                        log("country on tap initialdialcode ${widget.initialselectedCountryDialCode}");
                        log("country on tap initialdialflag ${widget.initialselectedCountryFlag}");
                        log("country on tap initialdialImagelink ${widget.initialselectedCountryFlagImage}");
                      }));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hwSpace(width: 5),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(widget.initialselectedCountryFlagImage!),
                ),
                hwSpace(width: 3),
                TextWidget(widget.initialSelectedCountryCode!,
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.w600)),
                const Icon(Icons.arrow_drop_down,
                    color: ColorFiles.appBarText,
                    textDirection: TextDirection.ltr),
                hwSpace(width: 5),
                const VerticalDivider(
                  color: ColorFiles.appBarText,
                  endIndent: 10,
                  indent: 10,
                  width: 1,
                ),
              ],
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: widget.phoneController,
              showCursor: true,
              readOnly: false,
              keyboardType: TextInputType.number,
              cursorColor: ColorFiles.appBarText,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: ColorFiles.appBarText,
              ),
              decoration: InputDecoration(
                suffixIcon: Icon(
                  widget.validNumber! ? Icons.check : Icons.close,
                  color: widget.validNumber!
                      ? ColorFiles.blacColor
                      : ColorFiles.activeIndicator,
                ),
                filled: true,
                fillColor: ColorFiles.transparent,
                hintStyle: const TextStyle(color: ColorFiles.greyColor),
                hintText: CommonString.appName,
                contentPadding: const EdgeInsets.all(12),
                border: InputBorder.none,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              onChanged: (value) {
                print("phone value is ${value}");
                if (value.isNotEmpty && value.length == 10) {
                  setState(() {
                    widget.validNumber = true;
                  });
                } else {
                  setState(() {
                   widget.validNumber = false;
                  });
                }
              },
              validator: (value) {
                if (value!.isEmpty || value.length != 10) {
                  setState(() {
                    widget.isErroAvialble = true;
                  });
                  return null;
                } else {
                  setState(() {
                    widget.isErroAvialble = false;
                  });
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
