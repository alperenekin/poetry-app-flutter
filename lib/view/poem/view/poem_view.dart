import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poem_app/core/components/background_container.dart';
import 'package:poem_app/view/poem/viewmodel/poem_viewmodel.dart';

class PoemView extends StatefulWidget {
  @override
  _PoemViewState createState() => _PoemViewState();
}

class _PoemViewState extends State<PoemView> {
  final PoemViewModel viewModel = PoemViewModelStore();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    viewModel.init();
    asyncInit();
  }

  Future<void> asyncInit() async {
    await viewModel.fetchAuthors();
  }

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
            'All Poets',
            textScaleFactor: 2,
          )),
    );
  }

  Flexible bodyListView() {
    return Expanded(
      child: Observer(builder: (context) {
        return viewModel.isLoading
            ? Center(child: CircularProgressIndicator())
            : Row(
              children: [
                Flexible(
                  flex: 9,
                  child: ListView.builder(
                      itemCount: viewModel.authorList?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return authorListTile(index);
                      },
                    ),
                ),
                Flexible(
                  flex: 1,
                  child: PageView.builder(
                    physics: PageScrollPhysics(),
                    onPageChanged: (value) {
                      setState(() {
                        print(value);
                        selectedIndex = value;
                      });
                    },
                    controller: PageController(),
                    scrollDirection: Axis.vertical,
                    itemCount: viewModel.letterList?.length,
                    itemBuilder: (context, index) {
                      print(index);
                        return Center(
                            child: Text(viewModel.letterList?[index] ?? '',
                                style: selectedIndex == index
                                    ? TextStyle(fontSize: 35, fontWeight: FontWeight.bold)
                                    : TextStyle(
                                        fontWeight: FontWeight.normal,
                                      )));
                      },
                  ),
                )
              ],
            );
      }),
    );
  }

  ListTile authorListTile(int index) {
    return ListTile(
      title: Text(
        viewModel.authorList?[index] ?? 'null',
        textScaleFactor: 1.2,
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.info,
          color: Colors.black,
        ),
        onPressed: () {
          viewModel.navigateToAuthorView(viewModel.authorList?[index] ?? '');
        },
      ),
    );
  }
}
