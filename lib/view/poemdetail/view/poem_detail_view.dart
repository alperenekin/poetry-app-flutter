import 'package:flutter/material.dart';
import 'package:poem_app/view/poem/model/poem_model.dart';

class PoemDetailView extends StatefulWidget {
  final List<PoemModel> poems;

  const PoemDetailView({Key? key, required this.poems}) : super(key: key);
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

  Container backgroundContainer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpeg"), fit: BoxFit.cover)),
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
            'All Poets',
            textScaleFactor: 2,
          )),
    );
  }

  Flexible bodyListView() {
    return Flexible(
        child: ListView.builder(
          itemCount: widget.poems.length,
          itemBuilder: (BuildContext context, int index) {
            return authorListTile(index);
          },
      ),
    );
  }

  ListTile authorListTile(int index) {
    String poem = '';
    widget.poems[index].lines?.forEach((element) {
      poem += element! + '\n';
    });
    return ListTile(
        title: Text(
          poem ?? 'null',
          textScaleFactor: 1.2,
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.green,
        ),
        trailing: Icon(
          Icons.info,
          color: Colors.black,
        ));
  }
}
