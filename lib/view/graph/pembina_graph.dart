import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:siskangv2/core/model/research_timeline_model.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/graph/graph_view.dart';

class PembinaGraph extends StatefulWidget {
  final Map<String, List<ResearchTimelineModel>> pembina1;
  final Map<String, List<ResearchTimelineModel>> pembina2;
  const PembinaGraph({
    Key? key,
    required this.pembina1,
    required this.pembina2,
  }) : super(key: key);

  @override
  State<PembinaGraph> createState() => _PembinaGraphState();
}

class _PembinaGraphState extends State<PembinaGraph> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SfCartesianChart(
        title: ChartTitle(text: "Grafik Pembina", textStyle: Get.textTheme.headline5),
        enableAxisAnimation: true,
        zoomPanBehavior: ZoomPanBehavior(enablePanning: true, zoomMode: ZoomMode.y),
        primaryXAxis: CategoryAxis(
            visibleMaximum: 6,
            visibleMinimum: 1,
            labelRotation: 0,
            labelIntersectAction: AxisLabelIntersectAction.rotate45,
            isInversed: false,
            labelsExtent: 150,
            labelPlacement: LabelPlacement.betweenTicks,
            autoScrollingMode: AutoScrollingMode.end,
            interval: 1,
            edgeLabelPlacement: EdgeLabelPlacement.shift),
        primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: (_getHighest(widget.pembina1, widget.pembina2) + 10),
            interval: 10),
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
          BarSeries<ChartData, String>(
              legendIconType: LegendIconType.circle,
              animationDuration: 700,
              color: Color.fromRGBO(8, 142, 255, 1),
              dataSource: _datas(widget.pembina1),
              pointColorMapper: (datum, index) => datum.color,
              xValueMapper: (datum, index) => datum.x,
              yValueMapper: (datum, index) => datum.y,
              name: "Sebagai Pembina 1"),
          BarSeries<ChartData, String>(
              legendIconType: LegendIconType.circle,
              animationDuration: 700,
              dataSource: _datas(widget.pembina2),
              pointColorMapper: (datum, index) => datum.color,
              xValueMapper: (datum, index) => datum.x,
              yValueMapper: (datum, index) => datum.y,
              color: Pallete.activeColor,
              name: "Sebagai Pembina 2")
        ],
        legend: Legend(
            itemPadding: 16,
            position: LegendPosition.right,
            alignment: ChartAlignment.far,
            overflowMode: LegendItemOverflowMode.scroll,
            padding: 0,
            title: LegendTitle(text: "Keterangan", textStyle: Get.textTheme.headline6),
            toggleSeriesVisibility: false,
            isVisible: true,
            orientation: LegendItemOrientation.auto,
            borderColor: Pallete.black,
            borderWidth: 2,
            isResponsive: true,
            iconHeight: 20,
            iconWidth: 20,
            textStyle: Get.textTheme.bodyText1),
      ),
    );
  }

  List<ChartData> _datas(datas) {
    List<ChartData> listData = [];
    datas.forEach((key, value) {
      listData.add(ChartData(key, value.length));
    });
    return listData;
  }

  double _getHighest(pemb1, pemb2) {
    var num1 = 0;
    var num2 = 0;
    pemb1.forEach((key, value) {
      if (num1 < value.length) {
        num1 = value.length;
      }
    });
    pemb2.forEach((key, value) {
      if (num2 < value.length) {
        num2 = value.length;
      }
    });
    return num1 < num2 ? num2.toDouble() : num1.toDouble();
  }
}
