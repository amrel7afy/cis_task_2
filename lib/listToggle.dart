import 'package:flutter/material.dart';

class Mazen extends StatefulWidget {
  const Mazen({Key key}) : super(key: key);

  @override
  State<Mazen> createState() => _MazenState();
}

class _MazenState extends State<Mazen> {
  var currentIndex = 0;
  List<bool> selectors = [];
  void selectItem(index)
  {
    setState(() {
      selectors[currentIndex] = false; //currentIndex=0
      currentIndex = index; //currentIndex=1
      selectors[currentIndex] = true;
    });
  }

  void initIndex(){
    for (int i =0 ; i<10;i++){
      selectors.add(false); //false,false,false,false,false,false,false,false,false,false,false
    } // length = 10
  }
  @override
  void initState() {
    initIndex();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) => InkWell(
                    onTap: () {
                     selectItem(index);
                    },
                    child: Container(
                      height:100,
                      width: 100,
                      color: selectors[index] ? Colors.red:Colors.green,
                      child: Text('Mazen $index'),
                    ),
                  ),
                  separatorBuilder: (context,index) => const SizedBox(width: 15,),
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}


