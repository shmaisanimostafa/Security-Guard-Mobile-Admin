import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Center(
        child: SizedBox(
          width: 150.0,
          height: 150.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Safe Scans'), Text('30')],
          ),
        ),
      ),
    );
  }
}
