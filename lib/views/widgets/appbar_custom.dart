import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_menu/resources/colors/light_and_dark_colors.dart';
import 'package:simple_menu/views/widgets/widgets.dart';
import '../../resources/colors/colors_prime.dart';

class Constants {
  static const List<dynamic> choiceA1 = [
    "Seleccionar chats",
    Icons.check_circle_outline
  ];
  static const List<dynamic> choiceA2 = ["Leer todo", Icons.message_outlined];

  static const List<dynamic> choiceB1 = [
    "Seleccionar canales",
    Icons.check_circle_outline
  ];
  static const List<dynamic> choiceB2 = ["Crear canal", Icons.groups];
  static const List<dynamic> choiceB3 = [
    "Privacidad de estado",
    Icons.lock_outline_rounded
  ];
  static const List<dynamic> choiceC1 = ["Editar", Icons.edit];

  static const List<List<dynamic>> appBarChoicesOne = <List<dynamic>>[
    choiceA1,
    choiceA2,
  ];
  static const List<List<dynamic>> appBarChoicesTwo = <List<dynamic>>[
    choiceB1,
    choiceB2,
    choiceB3,
  ];
  static const List<List<dynamic>> appBarChoicesThree = <List<dynamic>>[
    choiceC1
  ];
}

void choiceAction(String choice) {
  print(choice);
  /*if (choice == Constants.choiceA1[0]) {
    print('I First Item');
  } else if (choice == Constants.choiceA2[0]) {
    print('I Second Item');
  }*/
}

class AppBarCustomScreenOne extends StatefulWidget
    implements PreferredSizeWidget {
  const AppBarCustomScreenOne({super.key});

  @override
  State<AppBarCustomScreenOne> createState() => _AppBarCustomScreenOneState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarCustomScreenOneState extends State<AppBarCustomScreenOne> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: ColorUtil.getBackGround(context),
      title: Row(
        children: [
          PopupMenuButton<String>(
            color: ColorUtil.getBackGroundButtons(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            icon: Icon(
              Icons.more_horiz_rounded,
              size: 30,
              color: ColorUtil.getWhiteBlack(context),
            ),
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.appBarChoicesOne.map((List<dynamic> choice) {
                return PopupMenuItem<String>(
                  value: choice[0],
                  child: popupCustomItem(choice[0], choice[1]),
                );
              }).toList();
            },
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.camera_alt),
            iconSize: 30,
            color: ColorUtil.getWhiteBlack(context),
            onPressed: _openCamera,
          ),
          IconButton(
            icon: Icon(Icons.add_circle_outlined),
            iconSize: 34,
            color: ColorsPrime.red,
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: ColorUtil.getBackGround(context),
    );
  }
}

class AppBarCustomScreenTwo extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarCustomScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: ColorUtil.getBackGround(context),
      title: Row(
        children: [
          PopupMenuButton<String>(
            color: ColorUtil.getBackGroundButtons(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            icon: Icon(
              Icons.more_horiz_rounded,
              size: 30,
              color: ColorUtil.getWhiteBlack(context),
            ),
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.appBarChoicesTwo.map(
                (List<dynamic> choice) {
                  return PopupMenuItem<String>(
                    value: choice[0],
                    child: popupCustomItem(choice[0], choice[1]),
                  );
                },
              ).toList();
            },
          ),
          Spacer(),
        ],
      ),
      backgroundColor: ColorUtil.getBackGround(context),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class AppBarCustomScreenThree extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: ColorUtil.getBackGround(context),
      title: Row(
        children: [
          PopupMenuButton<String>(
            color: ColorUtil.getBackGroundButtons(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            icon: Icon(
              Icons.more_horiz_rounded,
              size: 30,
              color: ColorUtil.getWhiteBlack(context),
            ),
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.appBarChoicesThree.map(
                (List<dynamic> choice) {
                  return PopupMenuItem<String>(
                    value: choice[0],
                    child: popupCustomItem(choice[0], choice[1]),
                  );
                },
              ).toList();
            },
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.add_circle_outlined),
            iconSize: 34,
            color: ColorsPrime.red,
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: ColorUtil.getBackGround(context),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
