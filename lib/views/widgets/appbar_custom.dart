import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:simple_menu/models/choice_appbar_model.dart';
import 'package:simple_menu/resources/colors/light_and_dark_colors.dart';
import 'package:simple_menu/viewmodel/app_bar_view_model.dart';
import '../../resources/colors/colors_prime.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final int menuIndex;

  AppBarCustom({super.key, required this.menuIndex});

  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      //setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AppBarViewModel>(context);
    final choices = viewModel.appBarChoices[menuIndex];

    return AppBar(
      surfaceTintColor: ColorUtil.getBackGround(context),
      title: Row(
        children: [
          PopupMenuButton<String>(
            color: ColorUtil.getBackGroundButtons(context),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
            ),
            icon: Icon(
              Icons.more_horiz_rounded,
              size: 30,
              color: ColorUtil.getWhiteBlack(context),
            ),
            onSelected: viewModel.choiceAction,
            itemBuilder: (BuildContext context) {
              return choices.map((ChoiceModel choice) {
                return PopupMenuItem<String>(
                  value: choice.title,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(choice.title),
                      Icon(
                        choice.icon,
                        size: 18,
                      )
                    ],
                  ),
                );
              }).toList();
            },
          ),
          const Spacer(),
          if (menuIndex == 0)
            IconButton(
                icon: const Icon(Icons.camera_alt),
                iconSize: 30,
                color: ColorUtil.getWhiteBlack(context),
                onPressed: _openCamera),
          if (menuIndex != 1)
            IconButton(
              icon: const Icon(Icons.add_circle_outlined),
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
