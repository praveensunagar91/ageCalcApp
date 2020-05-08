import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    bool _visible=false;
  String name;
  int a,b,c;

  final TextEditingController nameController =  TextEditingController();
  final TextEditingController currentController= TextEditingController();
  final TextEditingController birthController = TextEditingController();
  void calculate(){
    setState(() {

      name=(nameController.text);
      a=int.parse(currentController.text);
      b=int.parse(birthController.text);
      c=a-b;
      print(c);

      print(name);
          _visible= true;

//  showDialog(
//          context: context,
//          builder: (context) {
//        return AlertDialog(
//          // Retrieve the text the user has entered by using the
//          // TextEditingController.
//          content: Text(" hey ${name} your age is ${c}"),
//        );
//      },
//);


    });
  }
 /// design statrts
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: (){},
          ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu,color: Colors.white,),
                  onPressed: (){},
                ),
          ],
          backgroundColor: Colors.blue,

        ),
        body: ListView(
          children: <Widget>[
            Image.asset('images/calc.png',),
            ListTile(
              leading: Icon(Icons.person,color: Colors.teal,),
              title: TextField(
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: InputDecoration(
                 labelText: 'Name',
                  hintText: 'Enter name',
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.date_range,color: Colors.teal,),
              title: (TextField(
                keyboardType: TextInputType.number,
                controller: currentController,
                decoration: InputDecoration(
                  hintText: 'Enter current year',
                  labelText: 'Current Year'
                ),
              )),
            ),
            ListTile(
              leading: Icon(Icons.date_range,color: Colors.teal,),
              title: TextField(
                keyboardType: TextInputType.number,
                controller: birthController,
                decoration: InputDecoration(
                  labelText: "Birth Year",
                  hintText: "Enter Your Birth Year"
                ),
              ),
            ),
            SizedBox(height: 50.0,),

            /// display output

         Visibility(
           maintainSize: true,
           maintainAnimation: true,
           maintainState: true,
           visible: _visible,
           child: Container(

              margin: EdgeInsets.only(left:60.0, right: 60.0),

              child: Center(
                child: Text(' Hey ${name} your age is ${c}',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
            ),
         ),


          SizedBox(height: 40.0,),

          ///button starts

          Container(
            margin: EdgeInsets.only(left:140,right: 140),
            padding: EdgeInsets.only(bottom: 5.0,top:5.0),
            decoration: BoxDecoration(

            ),
            child: RaisedButton(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),


              ),
              color: Colors.pink,
              hoverColor: Colors.blue,
              onPressed: calculate,
              child: Text('Click',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,

                ) ,
              ),



            ),
          ),



          ],
        ),
      ),
    );
  }
}

