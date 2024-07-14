import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/json_providing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    JsonProvider provider = Provider.of<JsonProvider>(context,listen: true);
    JsonProvider providerF = Provider.of<JsonProvider>(context,listen: false);

    return Scaffold(

      appBar: AppBar(
        title: Text('json parsing'),
      ),
      body: ListView.builder(
        itemCount: provider.userList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            provider.userList[index].description,
          ),
          subtitle: Text(provider.userList[index].name),


        ),
      ),
    );
  }
}
