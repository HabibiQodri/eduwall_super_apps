import 'package:eduwall_super_apps/screens/course_list.dart';
import 'package:eduwall_super_apps/screens/nilai_quiz.dart';
import 'package:eduwall_super_apps/widget/module_section.dart';
import 'package:eduwall_super_apps/widget/quiz_list_section.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseContent extends StatefulWidget {
  const CourseContent({super.key});

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  // final videoUrl = 'https://youtu.be/lMgoo5gtaXE?list=RDlMgoo5gtaXE';

  late YoutubePlayerController _controller;

  _CourseContentState()
      : _controller = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(
              'https://youtu.be/lMgoo5gtaXE?list=RDlMgoo5gtaXE')!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        );

  bool isModuleSection = true;

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
                    builder: (context) => CourseList(),
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
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          title: const Text(
            "Pertemuan 1",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: TextButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NilaiQuiz(),
                  ),
                ),
                icon: const Icon(
                  Icons.grade,
                  size: 28,
                  color: Color(0xFF3871C1),
                ),
                label: const Text(
                  "Nilai",
                  style: TextStyle(fontSize: 20, color: Color(0xFF3871C1)),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xfff5f3ff),
                ),
                child: Center(
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    onReady: () => debugPrint('Ready'),
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(
                        isExpanded: true,
                        colors: const ProgressBarColors(
                          playedColor: Color(0xFF3871C1),
                          handleColor: Color(0xFF3871C1),
                        ),
                      ),
                      const PlaybackSpeedButton(),
                      FullScreenButton(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "KALKULUS",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Peretemuan 1",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 5),
              Text(
                "10 Module",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F3FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      color: isModuleSection
                          ? Color(0xFF3871C1)
                          : Color(0xFF3871C1).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isModuleSection = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 35),
                          child: Text(
                            "Module",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: isModuleSection
                          ? Color(0xFF3871C1).withOpacity(0.6)
                          : Color(0xFF3871C1),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isModuleSection = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 35),
                          child: Text(
                            "Quiz",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              isModuleSection ? ModuleSection() : QuizListSection(),
            ],
          ),
        ),
      ),
    );
  }
}
