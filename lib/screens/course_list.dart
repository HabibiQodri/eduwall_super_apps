import 'package:eduwall_super_apps/screens/course_content.dart';
import 'package:eduwall_super_apps/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CourseList extends StatelessWidget {
  CourseList({super.key});

  final List<String> pertemuan = [
    "Pertemuan 1",
    "Pertemuan 2",
    "Pertemuan 3",
    "Pertemuan 4",
    "Pertemuan 5"
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Menampilkan dialog konfirmasi
        bool confirm = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Konfirmasi'),
            content: Text('Apakah Anda yakin ingin kembali?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Tidak'),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                ),
                child: Text('Ya'),
              ),
            ],
          ),
        );

        // Mengembalikan hasil dari dialog konfirmasi
        return confirm;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 230,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
                color: Color(0xFF3871C1),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 90,
                    left: 0,
                    child: Container(
                      height: 100,
                      width: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                      top: 120,
                      left: 20,
                      child: Text(
                        "Kalkulus",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFF3871C1),
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: pertemuan.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseContent(),
                      ),
                    );
                  },
                  child: Container(
                    height: 90,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF3871C1),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(80.0),
                        ),
                        boxShadow: [
                          new BoxShadow(
                            color: Color(0xFF3871C1).withOpacity(0.3),
                            offset: new Offset(-10.0, 0.0),
                            blurRadius: 20.0,
                            spreadRadius: 4.0,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.only(
                        left: 43,
                        top: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pertemuan[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
