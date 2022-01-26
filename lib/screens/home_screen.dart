import 'package:flutter/material.dart';
import 'package:flutter_find_large_three/utils/colors.dart';
import 'package:flutter_find_large_three/utils/config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController numberInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.primary_color_white,
      appBar: AppBar(
        title: Text("Demo App"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextBox(),
                Padding(
                  padding: EdgeInsets.only(top:12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(onPressed: insertToList, color: ColorsUtil.color_add,child: Text("Add To List",style: TextStyle(color: ColorsUtil.primary_color_white),)),
                      Config.numbersList.isEmpty?Container():FlatButton(onPressed: findResult, color: ColorsUtil.primary_color,child: Text("Find Result",style: TextStyle(color: ColorsUtil.primary_color_white),)),
                    ],
                  ),
                ),
                listSection()
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget TextBox(){
    return Padding(
      padding: EdgeInsets.only(top:10.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: numberInputController,
        enabled: true,
        /*onChanged:(value) {
          setState(() {
          });
        },*/
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Enter a Number"
        ),
      ),
    );
  }

  Widget listSection(){
    return Config.numbersList.isEmpty? Padding(
      padding: EdgeInsets.only(top:12.0),
      child: Center(child: Column(
        children: [
          Icon(Icons.warning_amber_rounded,size: 100.0,color: ColorsUtil.primary_color_brown,),
          Text("List is empty",style: TextStyle(color: ColorsUtil.primary_color_brown),)
        ],
      ),),
    ):Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.list),
                Text("Numbers List",style: TextStyle(color: ColorsUtil.primary_color,fontWeight: FontWeight.bold,fontSize: 16.0),),
              ],
            ),
            FlatButton(onPressed: clearList, color: ColorsUtil.color_transparent,child: Row(
              children: [
                Icon(Icons.delete,color: ColorsUtil.color_clear),
                Text("Clear List",style: TextStyle(color: ColorsUtil.color_clear),),
              ],
            )),
          ],
        ),
        listData()
      ],
    );
  }

  Widget _buildRow(int index){
    int order = index+1;
    return Padding(
      padding: EdgeInsets.only(bottom:12.0),
      child: ListTile(
          leading: CircleAvatar(
            child: Text("$order"),
          ),
          title: Text(
              "${Config.numbersList[index]}"
          ),
        ),
    );
  }

  Widget listData(){
    return Padding(
      padding: EdgeInsets.only(top:12.0),
      child: ListView.builder(
        shrinkWrap: true,
          itemCount: Config.numbersList.length,
          itemBuilder: (BuildContext context, int index){
          //if (index.isOdd) return Divider();
          //final index = i ~/2+1;
          return _buildRow(index);
  }
      ),
    );
    }

    void insertToList(){

      if (numberInputController.text.isEmpty) {
        triggerToast('Please enter a number');
      }
      else{
        if(isNumeric(numberInputController.text)){
          Config.numbersList.add(int.parse(numberInputController.text));
          triggerToast('Number added!');
          debugPrint(Config.numbersList.toString());
          setState(() {
            numberInputController.text = "";
          });
        }else{
          triggerToast('Please enter a valid number');
        }
      }

      /*else if (numberInputController.text is !int) {
        triggerToast('Please enter a valid number');
      }else if(numberInputController.text.isNotEmpty){
        Config.numbersList.add(int.parse(numberInputController.text));
        debugPrint(Config.numbersList.toString());
        setState(() {
        });
      }*/


    }

    void clearList(){
      setState(() {
        Config.numbersList.clear();
      });
    }

    void findResult(){

    Stopwatch stopWatch = Stopwatch()..start();

      int num1=0,num2=0,num3=0;
      int result=0;

      Config.numbersList.forEach((element) {
        if(element > num1){
          num3 = num2;
          num2 = num1;
          num1 = element;
        }else if(element > num2){
          num3 = num2;
          num2 = element;
        }else if(element > num3){
          num3 = element;
        }
      });

      result = num1 * num2 * num3;

    triggerToast("Largest numbers: $num1, $num2, $num3\nResult: $result\nTotal time taken: ${stopWatch.elapsed}");

    }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> triggerToast(String message){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));
    }

  bool isNumeric(String str) {
    try{
      var value = int.parse(str);
    } on FormatException {
      triggerToast("Please enter a valid number");
      return false;
    } finally {
      return true;
    }
  }
}
