import 'package:flutter/material.dart';
import 'package:marvel/model/marvel_model.dart';
import 'package:marvel/view_model/application_view_model.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/views/stateless.view.dart';

import '../../locator.dart';

class MarvelCharacters extends StatelessWidget {
  static const routeName = "/character";
  const  MarvelCharacters ({Key? key}) : super(key: key);

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
//   Marvel? models = Marvel();
//   Marvel? body;
//   Future loadModels() async{
//  //   'http://developers.marvel.com/v1/public/characters?&apiKey=c95ce8965c471b169043e399fe49e367'
//     http://gateway.marvel.com/v1/public/comics?ts=1&apikey=c95ce8965c471b169043e399fe49e367
//     try{ var response = await http.get(
//         Uri.parse('http://gateway.marvel.com/v1/public/characters?ts=1&apikey=c95ce8965c471b169043e399fe49e367'),
//         headers:<String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         }  );
//
//     body = models!.marvelFromJson(response.body);
//     // var body = json.decode(response.body);
//     print('ade');
//     print(response.body);
//     print('deeone');
//     //print(body);
//     // print(body['products']);
//     // print(body);
//     // setState(() {
//     //   print(body!.products);
//     //
//     //   // body.forEach( v) => product.add(Product()););
//     //   //  product.add(body['p
//     // });
//     }catch(e){print(e);}
//     return body;
//     print(body);
//   }
//
// // List  product =[];
// //   void initState() {
// //     super.initState();
// //     // loadProduct();
// //     print('object');
// //   }
  Widget render( context,model) {
    //late Future<Marvel> futureAlbum;
    return Scaffold(
      body: Column(
        children: [
          const Text('passed'),
          FutureBuilder(
              future: model.loadModels(),
              builder: (context, snapshot) {
                // snapshot.data[]

                return
                  snapshot.hasData?
                  Container(
                    color: Colors.white,
                    child:  GridView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 3),
                        itemBuilder: (BuildContext context, index){
                          return

                            GestureDetector(
                              // onTap: (){
                              // },
                              child: //Container()
                              MarvelHero(
                                name:model.models!.models!.character,
                                picture:model.models!.models!.photo
                              ),
                            );
                        }
                    ),
                  ): const Center(child:CircularProgressIndicator(),);
              }
          ),



          // GridView.builder(itemCount: product_list.length,
          // shrinkWrap: true,
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          //
          // ),
          // itemBuilder: (BuildContext context,int index){
          // return MarvelHeros(
          // name: product_list[index]['name'],
          // picture: product_list[index]['picture'],
          //
          // );
          // }
          // )

        ],
      ),
    );
  }
}

class MarvelHero extends StatelessWidget {
  final name;

  final picture;
   const MarvelHero({Key? key, this.name,this.picture, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius:BorderRadius.all(Radius.circular(20))
      ),
      child: Material(
        child: InkWell(onTap: (){},
          child: GridTile(
            footer: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(name.length > 10 ? name.substring(0, 10)+'...' : name,style: const TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
