import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:siskangv2/core/model/research_timeline_model.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/graph/graph_view.dart';

class TahapGraph extends StatefulWidget {
  final Map<String, List<ResearchTimelineModel>> data;
  const TahapGraph({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<TahapGraph> createState() => _TahapGraphState();
}

class _TahapGraphState extends State<TahapGraph> {
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
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
        PieSeries<ChartData, String>(
            legendIconType: LegendIconType.circle,
            animationDuration: 700,
            dataSource: _datas(),
            pointColorMapper: (datum, index) => datum.color,
            xValueMapper: (datum, index) => datum.x,
            yValueMapper: (datum, index) => datum.y,
            name: "Grafik Tahap Penelitian")
      ],
      legend: Legend(
          overflowMode: LegendItemOverflowMode.scroll,
          padding: 16,
          title: LegendTitle(text: "Keterangan"),
          toggleSeriesVisibility: false,
          isVisible: true,
          orientation: LegendItemOrientation.auto,
          borderColor: Pallete.black,
          borderWidth: 2,
          isResponsive: true,
          iconHeight: 20,
          iconWidth: 20,
          textStyle: Get.textTheme.headline6),
    );
  }

  List<ChartData> _datas() {
    List<ChartData> listData = [];
    widget.data.forEach((key, value) {
      listData.add(ChartData(key, value.length));
    });
    return listData;
  }
}
