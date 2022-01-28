import 'package:flutter/material.dart';
import 'package:marvel/constants/app_color.dart';
import 'package:marvel/view_model/application_view_model.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../locator.dart';

class Favorite extends StatelessWidget {
  static const routeName = "/favorite";
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<ApplicationViewModel>(view: (context,model)=>_View (),
        viewModel: locator<ApplicationViewModel>(),
        disposeVM: false,
    );
  }
}

class _View extends StatelessView<ApplicationViewModel>{
  
  @override
  Widget render( context,model) {
   return Scaffold(
     body: ListView.builder(
       itemCount: model.userList.length,
         itemBuilder: (BuildContext context, int index)=> Card(
           child: Card(
             child: Wrap(
             children: [
               Stack(
                   children: [
                     Image.network("${model.userList[index].thumbnail}"),
                     Positioned(
                       right:20 ,
                       child: IconButton(
                       onPressed: (){
                         model.deleteUser(index);
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) =>const Favorite(
                               )),
                         );
                       },
                       icon: const Icon(Icons.delete,
                         color: primaryColor,
                         size: 40,
                       ),
                     ),)
                   ]),
              ListTile(
                  title: Text("${model.userList[index].name}")
              )
             ],
           )
           ),
         )
     ),
   );
  }

}
