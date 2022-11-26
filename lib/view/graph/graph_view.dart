import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/core/common/research_grouping_enum.dart';
import 'package:siskangv2/core/controller/research_controller.dart';
import 'package:siskangv2/themes/color_pallete.dart';
import 'package:siskangv2/view/graph/tahap_graph.dart';
import 'package:siskangv2/view/graph/topik_graph.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphView extends StatefulWidget {
  const GraphView({Key? key}) : super(key: key);

  @override
  State<GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  final _research = Get.find<ResearchController>();
  final args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        log(orientation.toString());
        if (orientation == Orientation.portrait) {
          return Scaffold(
            body: SizedBox(
              width: Get.width,
              height: Get.height,
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 400),
                child: Expanded(
                    child: Container(
                  color: Pallete.black.withOpacity(0.6),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.stay_current_landscape_rounded,
                          size: 54,
                          color: Pallete.white.withOpacity(0.8),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Tampilan tersedia dalam mode landscape",
                            style: Get.textTheme.headline6!.copyWith(
                                color: Pallete.white.withOpacity(0.8), fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ),
            ),
          );
        } else {
          // final List<ChartData> chartData = [
          //   ChartData('David', 25),
          //   ChartData('Steve', 38),
          //   ChartData('Jack', 34),
          //   ChartData('advsdfv', 34),
          //   ChartData('Davebetfid', 66),
          //   ChartData('bertfbe', 55),
          //   ChartData('Jasfbvsfck', 12),
          //   ChartData('bsfberf', 98),
          //   ChartData('bedtfb', 77),
          //   ChartData('etrfbe', 88),
          //   ChartData('nrtgrnty', 56),
          //   ChartData('entfbnfg', 33)
          // ];
          // _changeOrientation(false);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Pallete.primaryLight,
                titleSpacing: 8,
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Grafik",
                    style: Get.textTheme.headline4
                        ?.copyWith(color: Pallete.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              body: SizedBox(
                width: Get.width,
                height: Get.height,
                child: _graph(args[0], args[1]),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _graph(ResearchGrouping group, [bool? isPembimbing1]) {
    switch (group) {
      case ResearchGrouping.TAHAP:
        return TahapGraph(data: _research.groupingResearchData(group, isPembimbing1));
      case ResearchGrouping.TOPIK:
        return TopikGraph(data: _research.groupingResearchData(group, isPembimbing1));
      default:
        return SizedBox();
    }
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final int y;
  final Color? color;
}
