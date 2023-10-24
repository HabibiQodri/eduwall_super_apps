import 'package:flutter/material.dart';

List<String> moduleList = [
  'Module 1',
  'Module 2',
  'Module 3',
  'Module 4',
  'Module 5',
  'Module 6',
  'Module 7',
  'Module 8',
  'Module 9',
];

class ModuleSection extends StatelessWidget {
  const ModuleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: moduleList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => ListTile(
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: index == 0
                ? Color(0xFF3871C1)
                : Color(0xFF3871C1).withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.archive_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(moduleList[index]),
        subtitle: Text("Judul Module"),
      ),
    );
  }
}
