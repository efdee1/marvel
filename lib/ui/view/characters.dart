import 'package:flutter/material.dart';
import 'package:marvel/model/model_marv.dart';
import 'package:marvel/view_model/application_view_model.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/views/stateless.view.dart';
import '../../locator.dart';
import 'character_detail.dart';

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
  Widget render( context,model) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FutureBuilder<Marv>(
                future: model.loadMarv(),
                builder: (context, snapshot) {

                  if (snapshot.hasData) {
                    return Container(
                      color: Colors.white,
                      child: model.body!.data!.results == 0 ? const Center(child:CircularProgressIndicator()): GridView.builder(
                          itemCount: model.body!.data!.results!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 3),
                          itemBuilder: (BuildContext context, int index ){
                            return
                              MarvelHero(
                                  name:model.body!.data!.results![index].name,
                                  picture:"https://images.unsplash.com/photo-1601645191163-3fc0d5d64e35?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1935&q=80",
                                 description: model.body!.data!.results![index].description,
                              );
                          }
                      ),
                    );
                  } else {
                    return const Center(child:CircularProgressIndicator(),);
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}

class MarvelHero extends StatelessWidget {
  final String? name;
  final String?description;
  final String? picture;
   const MarvelHero({Key? key, this.name,this.picture, this.description, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius:BorderRadius.all(Radius.circular(20))
      ),
      child: Hero(
        tag: name!,
        child: Material(
          child: InkWell(onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CharacterDetail(
                    character_detail_name:name,
                    character_detail_picture:picture,
                    character_detail_description: description.toString(),
                  )),
            );
          },
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
                        child: Text(name!.length > 10 ? name!.substring(0, 10)+'...' : name!,style: const TextStyle(
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
                  picture!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
