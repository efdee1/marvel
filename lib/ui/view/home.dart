import 'package:flutter/material.dart';
import 'package:marvel/constants/app_color.dart';
import 'package:marvel/ui/view/characters.dart';
import 'package:marvel/ui/view/favorite.dart';
import 'package:marvel/view_model/application_view_model.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../locator.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<ApplicationViewModel>(view: (context,model)=>_View (),
        viewModel: locator<ApplicationViewModel>(),
      disposeVM: false,
    );
  }
}

class _View extends StatelessView<ApplicationViewModel> {

  @override
  Widget render( context, model) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:<Widget>[
            const Text('Characters',
              style: TextStyle(
                  color: Colors.black
              ),
            ),
            IconButton(
              color: kSecondaryColor,
                onPressed:(){},
                icon:const Icon(Icons.settings)
            )
          ],
        ),
      ),
      body:
      //index(model.selectedIndex)

      Container(
        child:model.widgetOptions.elementAt(model.selectedIndex),
        // IndexedStack(
        //    index:model.selectedIndex,children: [
        //   MarvelCharacters(),
        //   Favorite()
        // ],
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  const[
           BottomNavigationBarItem(
              icon: Icon(Icons.list),
            label: 'Characters'

          ),


          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'favorite',
    )
        ],
        currentIndex: model.selectedIndex,
        selectedItemColor: kSecondaryColor,
        onTap:model.setSelectedIndex
      ),
    );
  }
}


