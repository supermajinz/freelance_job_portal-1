import 'package:flutter/material.dart';

class RangeSliderExample extends StatefulWidget {
  const RangeSliderExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RangeSliderExampleState createState() => _RangeSliderExampleState();
}

class _RangeSliderExampleState extends State<RangeSliderExample> {
  RangeValues _currentRangeValues = const RangeValues(1, 12);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RangeSlider(
          values: _currentRangeValues,
          min: 0,
          max: 20,
          divisions: 20,
          labels: RangeLabels(
            '${_currentRangeValues.start.round()} M',
            '${_currentRangeValues.end.round()} M',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),
        Text(
          'Range: ${_currentRangeValues.start.round()} - ${_currentRangeValues.end.round()} M',
        ),
      ],
    );
  }
}
