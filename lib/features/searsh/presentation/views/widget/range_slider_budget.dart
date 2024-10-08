import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';

class RangeSliderBudget extends StatefulWidget {
  const RangeSliderBudget(
      {super.key, required this.onChanged, required this.init});
  final void Function(int min, int max) onChanged;
  final RangeValues init;

  @override
  // ignore: library_private_types_in_public_api
  _RangeSliderExampleState createState() => _RangeSliderExampleState();
}

class _RangeSliderExampleState extends State<RangeSliderBudget> {
  late RangeValues _currentRangeValues;
  @override
  void initState() {
    _currentRangeValues = widget.init;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RangeSlider(
          values: _currentRangeValues,
          min: 500000,
          max: 50000000,
          divisions: (50000000 - 500000) ~/ 100000,
          labels: RangeLabels(
            '${_currentRangeValues.start.round()} ل.س',
            '${_currentRangeValues.end.round()} ل.س',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
            widget.onChanged(_currentRangeValues.start.toInt(),
                _currentRangeValues.end.toInt());
          },
        ),
        CustomSubTitleMedium(
          text:
              '${_currentRangeValues.start.round()} - ${_currentRangeValues.end.round()}',
          isCurrency: true, // تحديد أن النص يمثل قيمة مالية
        ),
      ],
    );
  }
}
