import 'package:capstone_proj/components/statistics_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
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
            Expanded(
              child: Card(
                child: Center(
                  child: Text('Analytics Histogram'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Card(
                child: Center(
                  child: Text('Piegram'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
