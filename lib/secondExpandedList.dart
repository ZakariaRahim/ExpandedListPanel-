import 'package:flutter/material.dart';


class SecondPanelView extends StatefulWidget {
  SecondPanelView({Key key}) : super(key: key);

  @override
  _SecondPanelViewState createState() => _SecondPanelViewState();
}

class _SecondPanelViewState extends State<SecondPanelView> {

List<Item> _data=generateItems(13);

Widget _buildListPanel(){
  return ExpansionPanelList(
    expansionCallback: (int index, bool isExpanded){
      setState(() {
        _data[index].isExpanded= !isExpanded;
      });
    },

   children: _data.map<ExpansionPanel>((Item item) {
     return ExpansionPanel(
       headerBuilder: (BuildContext context, bool isExpanded){
         return Card(
           
           elevation: 5,
                    child: ListTile(
                      tileColor: Colors.blue[200],
             title: Text(item.headerValue),
             subtitle: Text('You are lucky have ticket'),
             leading: Icon(Icons.chat_bubble),
           ),
         );
       },
        body: Card(
          elevation: 5,
                  child: ListTile(
            title: Text(item.expandedValue),
            subtitle: Text('Remove current item'),
            trailing: Icon(Icons.remove),
            onTap: (){
              setState(() {
                _data.removeWhere((currentitem) => item==currentitem);
              });
             
            },
            
          ),
        ),
        isExpanded: item.isExpanded,
        
        );
   }).toList(),
  );

}


 


  @override
  Widget build(BuildContext context) {
    return Container(
       child: SingleChildScrollView(
         child: Container(child: _buildListPanel(),)
       ),
    );
  }
}

class Item{
String headerValue;
String expandedValue;
bool isExpanded;

Item({this.headerValue,this.expandedValue,this.isExpanded=false});
}

List<Item> generateItems(int numOfItems){
  return List.generate(numOfItems, (index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'wow your number is $index, you are lucky'
    );
  });
}