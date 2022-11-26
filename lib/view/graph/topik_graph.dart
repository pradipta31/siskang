import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/graph/graph_view.dart';

class TopikGraph extends StatefulWidget {
  final Map<String, int> data;
  const TopikGraph({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<TopikGraph> createState() => _TopikGraphState();
}

class _TopikGraphState extends State<TopikGraph> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SfCartesianChart(
        title: ChartTitle(text: "Grafik Topik Penelitian", textStyle: Get.textTheme.headline5),
        enableAxisAnimation: true,
        zoomPanBehavior: ZoomPanBehavior(enablePanning: true, zoomMode: ZoomMode.x),
        primaryXAxis: CategoryAxis(
            visibleMaximum: 10,
            visibleMinimum: 1,
            labelIntersectAction: AxisLabelIntersectAction.trim,
            isInversed: false,
            labelsExtent: 100,
            labelPlacement: LabelPlacement.betweenTicks,
            autoScrollingMode: AutoScrollingMode.start,
            interval: 1,
            edgeLabelPlacement: EdgeLabelPlacement.shift),
        primaryYAxis: NumericAxis(minimum: 0, maximum: (_getHighest() + 10), interval: 10),
        tooltipBehavior: TooltipBehavior(
            enable: true,
            animationDuration: 500,
            color: Pallete.white,
            borderColor: Pallete.primaryLight,
            textStyle: Get.textTheme.bodyText1,
            textAlignment: ChartAlignment.center,
            shouldAlwaysShow: false,
            duration: 2000,
            activationMode: ActivationMode.singleTap,
            tooltipPosition: TooltipPosition.auto),
        series: [
          ColumnSeries<ChartData, String>(
              legendIconType: LegendIconType.circle,
              animationDuration: 700,
              dataSource: _datas(),
              pointColorMapper: (datum, index) => datum.color,
              xValueMapper: (datum, index) => datum.x,
              yValueMapper: (datum, index) => datum.y,
              name: "Grafik Tahap Penelitian")
        ],
        // legend: Legend(
        //     overflowMode: LegendItemOverflowMode.scroll,
        //     padding: 16,
        //     title: LegendTitle(text: "Keterangan"),
        //     toggleSeriesVisibility: false,
        //     isVisible: true,
        //     orientation: LegendItemOrientation.auto,
        //     borderColor: Pallete.black,
        //     borderWidth: 2,
        //     isResponsive: true,
        //     iconHeight: 20,
        //     iconWidth: 20,
        //     textStyle: Get.textTheme.headline6),
      ),
    );
  }

  List<ChartData> _datas() {
    List<ChartData> listData = [];
    widget.data.forEach((key, value) {
      listData.add(ChartData(key, value));
    });
    return listData;
  }

  double _getHighest() {
    var num = 0;
    widget.data.forEach((key, value) {
      if (num < value) {
        num = value;
      }
    });
    return num.toDouble();
  }
}
