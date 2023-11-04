
import 'package:countries_flag_code/src/country_list_response/country.dart';
import 'package:countries_flag_code/src/utils/colors_file.dart';
import 'package:countries_flag_code/src/utils/custom_widgets/custom_textfield.dart';
import 'package:countries_flag_code/src/utils/custom_widgets/hw_space.dart';
import 'package:countries_flag_code/src/utils/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryBottomSheet {
  static Future<dynamic> countryBottomSheet(
      context, List<Country> listOfCountry) async {
    TextEditingController searchedCountryFieldController =
        TextEditingController();
    List<Country>? searchedCountryList =listOfCountry ;
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
        isScrollControlled: true,
        backgroundColor: ColorFiles.transparent,
        context: context,
        enableDrag: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return Container(
            color: ColorFiles.transparent,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(
                left: 20.r, right: 20.r, bottom: 50.r, top: 50.r),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 100.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  )),
              child: Scaffold(
                backgroundColor: ColorFiles.transparent,
                body: StatefulBuilder(
                  builder:(context, setState) =>Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 12),
                            child: Center(
                              child: Container(
                                height: 4,
                                width: 96,
                                decoration: BoxDecoration(
                                  color: ColorFiles.appBarText,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          hwSpace(height: 10.h),
                          const TextWidget(
                            'Country List',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Column(
                            children: [
                              hwSpace(height: 10.h),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 14.w, right: 14.w),
                                child: CustomTextField(
                                  controller: searchedCountryFieldController,
                                  onChange: (searchCountry) {
                                    setState(() {
                                      // searchedCountryList!.clear();
                                      print("value is ${searchCountry}");
                                      print("search controller length ${searchedCountryList!.length}");
                                      if (searchCountry.isNotEmpty) {
                                        // filterSearchResults(value);
                                        searchedCountryList = listOfCountry
                                            .where((country) => country.name!
                                                .toLowerCase()
                                                .contains(searchCountry
                                                    .toLowerCase()))
                                            .toList();
                                      } else {
                                        searchedCountryList = listOfCountry;
                                      }
                                    });
                                  },
                                ),
                              ),
                              hwSpace(height: 7.h),
                              const Divider(
                                color: ColorFiles.greyColor,
                                height: 1,
                                thickness: 1,
                              )
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        top: 128.h,
                        left: 0.0,
                        bottom: 0.0,
                        right: 0.0,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.r),
                                    bottomRight: Radius.circular(20.r),
                                  ),
                                ),
                                child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 14.w,
                                          right: 14.w,
                                          top: 20.h,
                                          bottom: 70),
                                      child: ListView.builder(
                                        itemCount: searchedCountryList!.length,
                                        itemBuilder: (context, index) => countryCard(context, searchedCountryList![index]),
                                      )
                                    ),
                                
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Widget countryCard(BuildContext context, Country country) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, country);
      },
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        child: Card(
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    country.emoji.toString(),
                    style: const TextStyle(
                        color: ColorFiles.appBarText,
                        fontSize: 28,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                  child: Text(
                    country.dialCode.toString(),
                    style: const TextStyle(
                        color: ColorFiles.appBarText,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                  child: Text(
                    country.name.toString(),
                    style: const TextStyle(
                        color: ColorFiles.appBarText,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
