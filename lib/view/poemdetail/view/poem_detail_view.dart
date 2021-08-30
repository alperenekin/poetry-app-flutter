import 'package:flutter/material.dart';
import 'package:poem_app/core/components/background_container.dart';
import 'package:poem_app/core/extension/content_extension.dart';
import 'package:poem_app/view/poem/model/poem_model.dart';

class PoemDetailView extends StatefulWidget {
  final PoemModel poem;

  const PoemDetailView({Key? key, required this.poem}) : super(key: key);
  @override
  _PoemDetailViewState createState() => _PoemDetailViewState();
}

class _PoemDetailViewState extends State<PoemDetailView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: backgroundContainer(),
    );
  }

  BackgroundContainer backgroundContainer() {
    return BackgroundContainer(
      child: Column(
        children: [
          titleBar,
          bodyListView(),
        ],
      ),
    );
  }

  Padding get titleBar {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Center(
          child: Text(
            widget.poem.title ?? '',
            textScaleFactor: 2,
          )),
    );
  }

  Expanded bodyListView() {
    String lines = convertLinesToPoem();
    return Expanded(
      child: SingleChildScrollView(
        child: Row(
          children: [
            Spacer(flex: 1,),
            Expanded(flex: 4,child: Column(
              children: [
                Text(lines,textScaleFactor: 1.2,),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.poem.author ?? '',
                      textScaleFactor: 2,
                    )),
                context.emptySizedHeightBoxLow3x
              ],
            )),
            Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }

  String convertLinesToPoem() {
    String lines = '';
    widget.poem.lines?.forEach((element) {
      lines += element! + '\n';
    });
    return lines;
  }
}
