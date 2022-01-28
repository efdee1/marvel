import 'package:flutter/material.dart';
import 'package:marvel/constants/app_color.dart';
import 'package:marvel/model/my_model.dart';

import 'package:marvel/view_model/application_view_model.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../locator.dart';
import 'favorite.dart';

class CharacterDetail extends StatefulWidget {
  final  character_detail_name;
  final character_detail_picture;
  final character_detail_description;
  CharacterDetail({ this.character_detail_name,
    this.character_detail_picture,
    this.character_detail_description,
    //this.details,
  });
  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  @override
  Widget build(BuildContext context) {

     return MVVM<ApplicationViewModel>(viewModel: locator<ApplicationViewModel>(),
        disposeVM: false,view: (context,model)=>Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Stack(
                  children: [
                    ClipRRect(
                      child: Hero(
                        tag: widget.character_detail_picture,
                        child: Image.network(widget.character_detail_picture,height: 300,width: 500,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),

                    ),
                    Positioned(
                      top: 240,
                      left: 10, child:Text(widget.character_detail_name,style: const TextStyle(
                      color: kSecondaryColor,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),),
                    ),
                    Positioned(
                      top: 230,
                      right: 10,
                      child: IconButton(
                        onPressed: (){
                          model.addUser(User(name: widget.character_detail_name,thumbnail:widget.character_detail_picture, ));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>const Favorite( )),
                          );
                        },
                        icon: const Icon(Icons.favorite,
                          color: primaryColor,
                          size: 40,
                        ),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.character_detail_name,style: const TextStyle(
                    color: kSecondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),),

                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.character_detail_description,style: const TextStyle(
                    color: kSecondaryColor,
                    fontSize: 16,

                  ),),),
              ],
            ),
          ),
    )

    );

  }
}