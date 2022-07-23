import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siskangv2/login.dart';
import 'package:siskangv2/widget/button_main.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 82, 182, 223),
              Color.fromARGB(255, 65, 120, 212)
            ])),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset('asset/images/logo.png', width: 200, height: 150)),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.all(10.0)),
                        Center(
                          child: Text(
                            'Selamat Datang di SIsKA-NG',
                            style: TextStyle(
                                fontSize: 40.0,
                                color: Color.fromARGB(255, 226, 225, 225)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10.0)),
                        Text(
                          'Sistem Informasi Akademik (SIsKA) adalah sistem informasi yang ada pada Program Studi Ilmu Komputer Pascasarjana Universitas Pendidikan Ganesha (UNDIKSHA) prodi Ilmu Komputer. Sistem ini digunakan untuk membantu pengelolaan data penelitian mahasiswa pada Prodi ILKOM.',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color.fromARGB(255, 226, 225, 225)),
                          textAlign: TextAlign.center,
                        ),
                        Padding(padding: EdgeInsets.all(20.0)),
                        Center(
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }));
                            },
                            textColor: Colors.white,
                            padding: EdgeInsets.all(0.0),
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                          child: ButtonMain(height: 50, width: 200, text: "Menuju Halaman Login"),
                            // child: Container(
                            //   decoration: BoxDecoration(
                            //     gradient: LinearGradient(
                            //       colors: <Color>[
                            //         Color.fromARGB(255, 34, 74, 134),
                            //         Color.fromARGB(255, 34, 74, 134),
                            //         Color.fromARGB(255, 34, 74, 134),
                            //       ],
                            //     ),
                            //     borderRadius: BorderRadius.all(Radius.circular(10.0))
                            //   ),
                            //   padding: EdgeInsets.all(12.0),
                            //   child: Text('Menuju Halaman Login', style: TextStyle(
                            //     fontSize: 17.0,
                            //     fontFamily: 'Lora',
                            //     color: Color.fromARGB(255, 226, 225, 225)),
                            // textAlign: TextAlign.center,
                            //   ),),
                            ),
                          ),
                        // RaisedButton(
                        //   onPressed: () {
                        //     Navigator.push(context,
                        //         MaterialPageRoute(builder: (context) {
                        //       return LoginPage();
                        //     }));
                        //   },
                        //   child: Text('Menuju Halaman Login'),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
