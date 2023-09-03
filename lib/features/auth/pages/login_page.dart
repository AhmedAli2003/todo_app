import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/common/constants/app_assets.dart';
import 'package:todo_app/common/router/app_routes.dart';
import 'package:todo_app/common/theme/app_colors.dart';
import 'package:todo_app/common/theme/app_style.dart';
import 'package:todo_app/common/widgets/custom_outlined_button.dart';
import 'package:todo_app/common/widgets/custom_text_field.dart';
import 'package:todo_app/common/widgets/height_spacer.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _phoneController = TextEditingController();

  Country country = Country(
    phoneCode: '1',
    countryCode: 'US',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'USA',
    example: 'USA',
    displayName: 'United States',
    displayNameNoCountryCode: 'US',
    e164Key: "",
  );

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView(
            children: [
              const HeightSpacer(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(AppAssets.todoPNG),
              ),
              const HeightSpacer(20),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: ReusableText(
                  'Please enter your phone number',
                  style: appStyle(17, AppColors.kLight, FontWeight.w500),
                ),
              ),
              const HeightSpacer(20),
              Center(
                child: CustomTextField(
                  controller: _phoneController,
                  hintText: 'Enter phone number',
                  hintStyle: appStyle(16, AppColors.kBkDark, FontWeight.w500),
                  keyboardType: TextInputType.phone,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(20).copyWith(right: 4),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            backgroundColor: AppColors.kBkDark,
                            textStyle: appStyle(16, AppColors.kLight, FontWeight.w500),
                            searchTextStyle: appStyle(16, AppColors.kLight, FontWeight.w500),
                            inputDecoration: const InputDecoration(
                              hintText: 'Choose a country...',
                              hintStyle: TextStyle(color: AppColors.kGreyDk),
                              prefixIcon: Icon(Icons.search_rounded, color: AppColors.kLight),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.kLight),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.kLight),
                              ),
                            ),
                            bottomSheetHeight: kHeight * 0.6,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(kRadius),
                              topRight: Radius.circular(kRadius),
                            ),
                          ),
                          onSelect: (country) => setState(() => this.country = country),
                        );
                      },
                      child: ReusableText(
                        '${country.flagEmoji} +${country.phoneCode}',
                        style: appStyle(18, AppColors.kBkDark, FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const HeightSpacer(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomOutlinedButton(
                  onTap: () {
                    GoRouter.of(context).go("/login/${AppRoutes.otp}");
                  },
                  height: kHeight * 0.07,
                  width: kWidth * 0.9,
                  borderColor: AppColors.kBkDark,
                  color: AppColors.kLight,
                  text: 'Send Code',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
