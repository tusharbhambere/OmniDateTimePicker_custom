/// A DateTime picker to pick a single DateTime or a DateTime range.
///
/// Use [showOmniDateTimePicker] to pick a single DateTime.
///
/// Use [showOmniDateTimeRangePicker] to pick a DateTime range.
///
library omni_datetime_picker;

import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/src/omni_datetime_picker.dart';
import 'package:omni_datetime_picker/src/omni_datetime_range_picker.dart';

/// Show bottom modal sheet of the [OmniDateTimePicker]
///
/// Returns a DateTime
///
Future<DateTime?> showOmniDateTimePicker({
  required BuildContext context,
  Widget? title,
  Widget? separator,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  bool? is24HourMode,
  bool? isShowSeconds,
  int? minutesInterval,
  int? secondsInterval,
  bool? isForce2Digits,
  BorderRadiusGeometry? borderRadius,
  BoxConstraints? constraints,
  Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
      transitionBuilder,
  Duration? transitionDuration,
  OmniDateTimePickerType type = OmniDateTimePickerType.dateAndTime,
  final bool Function(DateTime)? selectableDayPredicate,
  ThemeData? theme,
}) {
  return showModalBottomSheet(
    isScrollControlled: true, // Set this to true

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(10),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    context: context,
    builder: (BuildContext context) {
      return Theme(
        data: theme ?? Theme.of(context),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 2.4 / 3,
          child: OmniDateTimePicker(
            separator: separator,
            title: title,
            type: type,
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
            is24HourMode: is24HourMode,
            isShowSeconds: isShowSeconds,
            minutesInterval: minutesInterval,
            secondsInterval: secondsInterval,
            isForce2Digits: isForce2Digits,
            borderRadius: borderRadius,
            constraints: constraints,
            selectableDayPredicate: selectableDayPredicate,
          ),
        ),
      );
    },
  );
}

/// Show bottom modal sheet of the [OmniDateTimeRangePicker]
///
/// Returns a List<DateTime>
/// with index 0 as startDateTime
/// and index 1 as endDateTime
///
Future<List<DateTime>?> showOmniDateTimeRangePicker({
  required BuildContext context,
  DateTime? startInitialDate,
  DateTime? startFirstDate,
  DateTime? startLastDate,
  DateTime? endInitialDate,
  DateTime? endFirstDate,
  DateTime? endLastDate,
  bool? is24HourMode,
  bool? isShowSeconds,
  int? minutesInterval,
  int? secondsInterval,
  bool? isForce2Digits,
  BorderRadiusGeometry? borderRadius,
  BoxConstraints? constraints,
  Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
      transitionBuilder,
  Duration? transitionDuration,
  bool? barrierDismissible,
  OmniDateTimePickerType type = OmniDateTimePickerType.dateAndTime,
  bool Function(DateTime)? selectableDayPredicate,
  ThemeData? theme,
  DefaultView defaultView = DefaultView.start,
}) {
  return showModalBottomSheet(
    isScrollControlled: true, // Set this to true

    context: context,
    builder: (BuildContext context) {
      return Theme(
        data: theme ?? Theme.of(context),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 2.4 / 3,
          child: OmniDateTimeRangePicker(
            type: type,
            startInitialDate: startInitialDate,
            startFirstDate: startFirstDate,
            startLastDate: startLastDate,
            endInitialDate: endInitialDate,
            endFirstDate: endFirstDate,
            endLastDate: endLastDate,
            is24HourMode: is24HourMode,
            isShowSeconds: isShowSeconds,
            minutesInterval: minutesInterval,
            secondsInterval: secondsInterval,
            isForce2Digits: isForce2Digits,
            borderRadius: borderRadius,
            constraints: constraints,
            selectableDayPredicate: selectableDayPredicate,
            defaultView: defaultView,
          ),
        ),
      );
    },
  );
}

/// Type of the [OmniDateTimePicker]
/// default to dateAndTime if not selected
enum OmniDateTimePickerType {
  date,
  dateAndTime,
}

/// Decides which tab open by default
enum DefaultView { start, end }
