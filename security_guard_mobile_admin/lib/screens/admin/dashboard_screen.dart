import 'package:capstone_proj/components/line_chart_one.dart';
import 'package:capstone_proj/components/line_chart_two.dart.dart';
import 'package:capstone_proj/components/statistics_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            Row(
              children: [
                Expanded(
                  child: StatisticsCard(),
                ),
                Expanded(
                  child: StatisticsCard(),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: StatisticsCard(),
                ),
                Expanded(
                  child: StatisticsCard(),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: Card(
                child: Center(
                  child: LineChartSample1(),
                  // Text('Analytics Histogram'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Card(
                child: Center(child: LineChartSample2()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
