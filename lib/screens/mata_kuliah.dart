import 'package:eduwall_super_apps/screens/course_list.dart';
import 'package:flutter/material.dart';

class MataKuliah extends StatelessWidget {
  List catNames = [
    "Kalkulus",
    "Algoritma dan Pemograman",
    "Komputer Grafik",
    "Jaringan",
    "Bahasa Inggris",
    "Pemograman Web",
  ];

  List<Color> catColors = const [
    Color(0xffffcf2f),
    Color(0xff6fe09d),
    Color(0xff61bdfd),
    Color.fromARGB(255, 239, 53, 74),
    Color.fromARGB(255, 243, 97, 253),
    Color.fromARGB(255, 233, 88, 47),
  ];

  List<Icon> catIcons = const [
    Icon(Icons.numbers, color: Colors.white, size: 30),
    Icon(Icons.quiz, color: Colors.white, size: 30),
    Icon(Icons.computer, color: Colors.white, size: 30),
    Icon(Icons.network_cell, color: Colors.white, size: 30),
    Icon(Icons.flag, color: Colors.white, size: 30),
    Icon(Icons.web, color: Colors.white, size: 30),
  ];

  List imgList = [
    'businees',
    'communication',
    'medicene',
    'tech',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
          decoration: const BoxDecoration(
            color: Color(0xFF3871C1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.dashboard,
                    size: 30,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.notifications,
                    size: 30,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 3, bottom: 15),
                child: Text(
                  "EduWall Super Apps",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    wordSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 20),
                width: MediaQuery.of(context).size.width,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search here...",
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              Text(
                "Mata Kuliah",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                itemCount: catNames.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseList(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: catColors[index],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: catIcons[index],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          catNames[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const [
              //     Text(
              //       "Kategori",
              //       style:
              //           TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              //     ),
              //     Text(
              //       "Lihat Semua",
              //       style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.w500,
              //           color: Color(0xFF674AEF)),
              //     )
              //   ],
              // ),
              // const SizedBox(height: 10),
              // GridView.builder(
              //   itemCount: imgList.length,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     childAspectRatio:
              //         (MediaQuery.of(context).size.height - 50 - 25) /
              //             (4 * 20),
              //     mainAxisSpacing: 10,
              //     crossAxisSpacing: 10,
              //   ),
              //   itemBuilder: (context, index) {
              //     return InkWell(
              //       onTap: () {},
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(
              //           vertical: 20,
              //           horizontal: 10,
              //         ),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //           color: const Color(0xFFF5F3FF),
              //         ),
              //         child: Column(
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.all(10),
              //               child: Image.asset(
              //                 "images/${imgList[index]}.png",
              //                 scale: 2,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
