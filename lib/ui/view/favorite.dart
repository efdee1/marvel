import 'package:flutter/material.dart';
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
     body: Container(
       child: Column(
         children: [
           Text('BODY'),
         ],
       ),
     ),
   );
  }

}
