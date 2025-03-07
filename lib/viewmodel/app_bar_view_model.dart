import 'package:flutter/material.dart';
import 'package:simple_menu/models/choice_appbar_model.dart';

class AppBarViewModel extends ChangeNotifier {
  final List<List<ChoiceModel>> appBarChoices = [
    [
      ChoiceModel("Seleccionar chats", Icons.check_circle_outline),
      ChoiceModel("Leer todo", Icons.message_outlined),
    ],
    [
      ChoiceModel("Seleccionar canales", Icons.check_circle_outline),
      ChoiceModel("Crear canal", Icons.groups),
      ChoiceModel("Privacidad de estado", Icons.lock_outline_rounded),
    ],
    [
      ChoiceModel("Editar", Icons.edit),
    ],
  ];

  void choiceAction(String choice) {
    print(choice);
    // Aquí iría la lógica de negocio según la opción seleccionada.
  }
}
