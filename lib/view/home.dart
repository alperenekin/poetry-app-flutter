import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final poemList = [
      "To My Wife",
      "Confession",
      "The Wondrous Moment of our Meeting",
      "To the Dessert",
      "Love's blidness",
      "Song",
      "The Giver of Stars",
      "To My Dear and Loving Husband",
      "Love Will Find Out The Way",
      "What are You, Love?",
      "The Greatest Gift",
      "R&R",
      "Eğer",
      "Words, Wide Night",
      "Because She Would Ask Me Why I",
      "Loved Her",
      "The Passionate Shepherd to His Love",
      "Bread and Music",
      'The Much and More'
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text('My Poem App',style: TextStyle(color: Colors.black),),
      ),
      body: Container(
        color: Colors.pink.shade100,
//        decoration: BoxDecoration(
//            image: DecorationImage(
//                image: AssetImage("images/bg.jpeg"), fit: BoxFit.cover)),
        child:Column(
          children: [
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child:Text("Poems | all | poets",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    )
                  ],
                )),
            Expanded(
              flex: 10,
              child: ListView.builder(
                itemCount: poemList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child:Center(
                      child: Text(poemList[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ) ,
                  );
                },
              ),
            )
          ],
        )
      )
    );
  }
}
