import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// сделать график ProizvodstvoLinarChart1 с 12 месяцами

class ProizvodstvoLinarChart1 extends StatelessWidget {
  const ProizvodstvoLinarChart1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        //padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: LineChart(
          LineChartData(
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(1, 1),
                  const FlSpot(2, 3),
                  const FlSpot(3, 10),
                  const FlSpot(4, 7),
                  const FlSpot(5, 12),
                  const FlSpot(6, 13),
                  const FlSpot(7, 17),
                  const FlSpot(8, 15),
                  const FlSpot(9, 20),
                  const FlSpot(10, 20),
                  const FlSpot(11, 20),
                  const FlSpot(12, 20),
                ],
                isCurved: true, // делаем линии кривыми
                dotData: const FlDotData(show: false), // отключаем точки
              ),
            ],
            titlesData: FlTitlesData(

                //bottomTitles:
                ),
          ),
        ),
      ),
    );
  }
}
