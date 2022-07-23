import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/widget/dashboard_menu.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({Key? key}) : super(key: key);

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  String nama = "I Gede Pradipta Adi Nugraha, S.Kom";

  @override
  void initState() {
    controller = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 93, 126, 143),
          leading: Container(
            child: Image.asset(
              'asset/images/logo.png',
              scale: 5,
            ),
          ),
          title: Text(
            'SIsKA-NG',
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.amber,
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Halo, $nama",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'lora'),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Selamat datang di SisKa-NG",
                          style: TextStyle(
                              fontFamily: 'lora',
                              fontSize: 14,
                              color: Color.fromRGBO(176, 190, 197, 1)),
                        )
                      ],
                    )),
                    Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      child: Text(
                        "Aktif",
                        style: TextStyle(
                            fontSize: 17.0,
                            fontFamily: 'Lora',
                            color: const Color.fromARGB(255, 226, 225, 225)),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //     margin: EdgeInsets.all(0.0),
            //     color: Color.fromARGB(255, 226, 226, 226),
            //     height: 100,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         RichText(
            //           text: TextSpan(
            //             children: <TextSpan>[
            //               TextSpan(
            //                   text: 'hello',
            //                   style: TextStyle(color: Colors.red)),
            //               TextSpan(
            //                   text: ' world',
            //                   style: TextStyle(color: Colors.blue)),
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // Flexible(
            //   flex: 1,
            //   child: Container(
            //     color: Color.fromARGB(255, 255, 250, 250),
            //   ),
            // ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Container(
                      height: 150,
                      width: Get.width,
                      color: Colors.white,
                      child: Center(
                        child: GridView.count(crossAxisCount: 4, shrinkWrap: true, crossAxisSpacing: 8, children: [
                          DashboardMenu(svgIcon: "", menuName: "Berita", height: 80, buttonColor: Colors.blue,),
                          DashboardMenu(svgIcon: "", menuName: "Berita", height: 80, buttonColor: Colors.blue,),
                          DashboardMenu(svgIcon: "", menuName: "Berita", height: 80, buttonColor: Colors.blue,),
                          DashboardMenu(svgIcon: "", menuName: "Berita", height: 80, buttonColor: Colors.blue,),
                        ],),
                      )
                    ),
                  ),
                  Expanded(child: Container(
                    color: Colors.white,
                  ))
                ],
              )
            )
          ],
        ),
        bottomNavigationBar: Material(
          color: Color.fromARGB(255, 93, 126, 143),
          child: TabBar(
            controller: controller,
            tabs: [
              Tab(icon: Icon(Icons.sports_bar)),
              Tab(icon: Icon(Icons.sports_soccer)),
              Tab(icon: Icon(Icons.sports_mma)),
              Tab(icon: Icon(Icons.sports_tennis)),
            ],
          ),
        ),
      ),
    );
  }
}
