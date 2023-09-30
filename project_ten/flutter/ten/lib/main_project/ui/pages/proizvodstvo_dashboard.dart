import 'package:flutter/material.dart';
import 'package:ten/main_project/ui/pages/proizvodstvo_action_button.dart';
import 'package:ten/main_project/ui/pages/proizvodstvo_charts/linar_chart.dart';

class ProizvodstvoDashboard extends StatelessWidget {
  const ProizvodstvoDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: Wrap(
                spacing: 15,
                alignment: WrapAlignment.spaceEvenly,
                //crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.5,
                    child: ProizvodstvoLinarChart1(),
                    width: 450,
                    height: 450,
                    decoration: BoxDecoration(color: Colors.black26),
                  ),
                  Container(
                    width: 450,
                    height: 450,
                    decoration: BoxDecoration(color: Colors.black26),
                  ),
                  Container(
                    width: 450,
                    height: 450,
                    decoration: BoxDecoration(color: Colors.black26),
                  ),
                  Container(
                    width: 450,
                    height: 450,
                    decoration: BoxDecoration(color: Colors.black26),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ProizvodstvoButton(),
    );
  }
}

class LinearSales {
  final int month;
  final int sales;

  LinearSales(this.month, this.sales);
}



// import 'package:flutter/material.dart';

// class ProizvodstvoTest extends StatelessWidget {
//   const ProizvodstvoTest({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Row(
//         children: [Expanded(child: Text('data'))],
//       ),
//     );
//   }
// }


// Column(
//         children: [
//           Container(
//             width: width,
//             height: height * 0.2,
//             child: charts.LineChart(
//               data,
//               animate: true,
//               defaultRenderer: new charts.LineRendererConfig(
//                 includeArea: true,
//                 stacked: true,
//               ),
//               primaryMeasureAxis: new charts.NumericAxisSpec(
//                 tickFormatterSpec: new charts.BasicNumericTickFormatterSpec(
//                   (value) => '${(value ?? 0).toInt()}%',
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             width: width,
//             height: height * 0.1,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: 20,
//                       height: planMaxHeight,
//                       color: Colors.yellow,
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       'Plan Max',
//                       style: TextStyle(fontSize: 12),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: 20,
//                       height: factHeight,
//                       color: Colors.blue,
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       'Fact',
//                       style: TextStyle(fontSize: 12),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: 20,
//                       height: planMinHeight,
//                       color: Colors.red,
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       'Plan Min',
//                       style: TextStyle(fontSize: 12),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),