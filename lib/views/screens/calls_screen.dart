import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simple_menu/models/call_model.dart';
import 'package:simple_menu/resources/colors/light_and_dark_colors.dart';
import 'package:simple_menu/viewmodel/call_view_model.dart';
import 'package:simple_menu/views/widgets/widgets.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  void initState() {
    super.initState();
    Provider.of<CallViewModel>(context, listen: false).loadCalls();
  }

  void onButtonPressed(CallModel call) {
    print(call.name);
  }

  @override
  Widget build(BuildContext context) {
    final callVM = Provider.of<CallViewModel>(context);

    return callVM.calls.isEmpty
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, top: 0.0, right: 12.0, bottom: 12.0),
                  child: Text(
                    "Llamadas",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: ColorUtil.getWhiteBlack(context)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, top: 0.0, right: 12.0, bottom: 12.0),
                  child: Text(
                    "Recientes",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorUtil.getWhiteBlack(context),
                    ),
                  ),
                ),
                Column(
                  children: List.generate(
                    callVM.calls.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 3.0, bottom: 3.0),
                      child: CustomButtonCall(
                        callInfo: callVM.calls[index],
                        onPressed: () => onButtonPressed(callVM.calls[index]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
