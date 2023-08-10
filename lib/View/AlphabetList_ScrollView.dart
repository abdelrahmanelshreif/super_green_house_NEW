
import 'package:flutter/material.dart';
import 'package:azlistview/azlistview.dart';
class CountryList extends ISuspensionBean{
  final String title;
  final String tag;
  CountryList({required this.title,required this.tag});
  String getSuspensionTag()=>tag;
}
class AlphabetListScrollView extends StatefulWidget {
  final List<String> items;
  const AlphabetListScrollView({super.key,required this.items}) ;

  @override
  State<AlphabetListScrollView> createState() => _AlphabetListScrollViewState();
}

class _AlphabetListScrollViewState extends State<AlphabetListScrollView> {
  List <CountryList> items=[];
  @override
  void initState() {

    super.initState();
    initList(widget.items);
  }
  void initList(List<String> items)
  {
items.map((item) => CountryList(title: item,tag: item[0])).toList();
  }
  @override
  Widget build(BuildContext context) => AzListView(indexBarMargin: EdgeInsets.all(10),
  indexHintBuilder: (context, tag) => Container(
    width: 50,
    height: 50,
    alignment: Alignment.center,
    color: Colors.indigo,
    child: Text(tag,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
  ),
  indexBarOptions: IndexBarOptions(
    indexHintAlignment: Alignment.centerRight,
      selectTextStyle:TextStyle(
        color: Colors.white,fontWeight: FontWeight.bold,
      ),
    selectItemDecoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.cyanAccent,
    ),
  ),data: items, itemCount: items.length, itemBuilder: (context, index) {
    final item=items[index];
    return _buildListitem(item);
  },);
  Widget _buildListitem(CountryList item)=>ListTile(
    title:Text(item.title),
  );
}
