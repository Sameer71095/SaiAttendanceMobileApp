import 'package:flutter/widgets.dart';
import 'package:location/location.dart';
import 'package:sai_attendance/enums/device_screen_type.dart';

Location location = Location();
DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.shortestSide;

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  }

  if (deviceWidth > 600) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}
