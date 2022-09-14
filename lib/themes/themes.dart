import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:siskangv2/themes/color_pallete.dart';

class Themes {
  /// Theme for light mode
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      cardColor: Pallete.white,
      fontFamily: "BeVietnamPro",
      primaryColor: Pallete.primaryLight,
      shadowColor: Pallete.darkGrey,
      colorScheme: const ColorScheme.light(primary: Pallete.primaryLight),
      unselectedWidgetColor: Pallete.unselectedColor,
      backgroundColor: Pallete.background,
      visualDensity: VisualDensity.comfortable,
      scaffoldBackgroundColor: Pallete.background,
      applyElevationOverlayColor: false,
      radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) => Get.theme.primaryColor)),
      bannerTheme: const MaterialBannerThemeData(
          backgroundColor: Pallete.background,
          padding: EdgeInsets.all(16),
          leadingPadding: EdgeInsets.all(12.0),
          contentTextStyle: TextStyle(color: Pallete.textHeadlineColor, fontSize: 14.0)),
      buttonTheme: ButtonThemeData(
          buttonColor: Pallete.buttonMainColor,
          height: 44.0,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        animationDuration: const Duration(milliseconds: 300),
        foregroundColor: MaterialStateProperty.resolveWith((states) => Pallete.backgroundUncover),
        backgroundColor: MaterialStateProperty.resolveWith((states) => Get.theme.primaryColor),
        textStyle: MaterialStateProperty.resolveWith(
          (states) => const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.7,
            color: Pallete.textHeadlineColor,
          ),
        ),
        fixedSize: MaterialStateProperty.resolveWith(
          (states) => Size(Get.width, 48.0),
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        elevation: MaterialStateProperty.resolveWith((states) => 0.0),
      )),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          animationDuration: const Duration(milliseconds: 500),
          foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black),
          textStyle: MaterialStateProperty.resolveWith(
            (states) => const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.7,
              color: Pallete.darkGrey,
            ),
          ),
          side: MaterialStateProperty.resolveWith(
            (states) => BorderSide(
              color: Colors.grey[700]!,
              width: 1.0,
            ),
          ),
          fixedSize: MaterialStateProperty.resolveWith(
            (states) => Size(Size.infinite.width, 48.0),
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          elevation: MaterialStateProperty.resolveWith((states) => 0.0),
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontFamily: "Rubik",
          fontSize: 16.0,
          color: Pallete.textBodyColor,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(
          fontSize: 14.0,
          height: 1.23,
          color: Colors.grey[600]!,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: const TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.normal,
          height: 1.5,
          color: Colors.black54,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.white,
        elevation: 1.0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white, elevation: 1.0, enableFeedback: true),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        elevation: 1.0,
        modalBackgroundColor: Colors.black12,
        constraints: BoxConstraints(minWidth: double.infinity, minHeight: 200.0, maxHeight: 560.0),
      ),
      cardTheme: const CardTheme(
          color: Colors.white,
          margin: EdgeInsets.all(16.0),
          shadowColor: Colors.black12,
          elevation: 1.0),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.grey[100]!,
        disabledColor: Colors.grey[100]!,
        selectedColor: const Color(0xFF75DF1C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        secondarySelectedColor: const Color(0xFF75DF1C),
        elevation: 0,
        labelPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        shadowColor: Colors.transparent,
        selectedShadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        labelStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 13.0,
          fontWeight: FontWeight.normal,
        ),
        secondaryLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 13.0,
          fontWeight: FontWeight.normal,
        ),
        brightness: Brightness.light,
      ),
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        elevation: 1.0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Pallete.primaryLight,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Pallete.primaryLight,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Pallete.transparent,
        titleTextStyle: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w700,
          color: Pallete.textTitleColor,
        ),
        iconTheme: IconThemeData(
          color: Pallete.white,
          size: 18.0,
        ),
      ),
      errorColor: Colors.red,
      iconTheme: IconThemeData(
        size: 20.0,
        color: Colors.blueGrey[800],
        opacity: 1.0,
      ),
      primaryIconTheme: const IconThemeData(
        size: 20.0,
        color: Pallete.white,
      ),
      sliderTheme: SliderThemeData(
        inactiveTrackColor: Colors.grey[200],
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontFamily: "BeVietnamPro",
          fontWeight: FontWeight.normal,
          color: Pallete.textHeadlineColor,
          fontSize: 48.0,
        ),
        headline2: TextStyle(
          fontFamily: "BeVietnamPro",
          fontWeight: FontWeight.normal,
          color: Pallete.textHeadlineColor,
          fontSize: 32.0,
        ),
        headline3: TextStyle(
          fontFamily: "BeVietnamPro",
          fontWeight: FontWeight.normal,
          color: Pallete.textHeadlineColor,
          fontSize: 24.0,
        ),
        headline4: TextStyle(
            fontFamily: "BeVietnamPro",
            fontSize: 20,
            color: Pallete.textHeadlineColor,
            fontWeight: FontWeight.normal),
        headline5: TextStyle(
          fontFamily: "BeVietnamPro",
          fontWeight: FontWeight.normal,
          color: Pallete.textHeadlineColor,
          fontSize: 18.0,
        ),
        headline6: TextStyle(
          fontFamily: "BeVietnamPro",
          fontWeight: FontWeight.normal,
          color: Pallete.textHeadlineColor,
          fontSize: 14.0,
        ),
        subtitle1: TextStyle(
          fontFamily: "BeVietnamPro",
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Pallete.textBodyColor,
        ),
        subtitle2: TextStyle(
          fontFamily: "BeVietnamPro",
          fontSize: 15.0,
          color: Pallete.textBodyColor,
          fontWeight: FontWeight.normal,
        ),
        button: TextStyle(
          fontFamily: "BeVietnamPro",
          fontSize: 12,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.7,
          color: Pallete.white,
        ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          height: 1.5,
          color: Pallete.textBodyColor,
        ),
        bodyText2: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: Pallete.textBodyColor,
        ),
        caption: TextStyle(
          color: Pallete.textBodyColor,
          fontSize: 11.30,
        ),
        overline: TextStyle(
          color: Pallete.textBodyColor,
          wordSpacing: 0,
          letterSpacing: 0,
          height: 1.5,
        ),
      ),
    );
  }

  static settingStatusBarColor({bool isDark = false}) {
    if (isDark) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }
}
