import 'package:movieapp2/UI/actors_details/actor_details_screen.dart';
import 'package:movieapp2/UI/actors_list/actor_widget.dart';
import 'package:movieapp2/UI/actors_list/actors_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'actors_list_provider.dart';

// ignore: must_be_immutable
class ActorsScreen extends StatefulWidget {
  ActorsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ActorsScreenState createState() => _ActorsScreenState();
}

class _ActorsScreenState extends State<ActorsScreen> {
  int pageNumber = 1;
  // ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // pageNumber = 2;
    super.initState();
    // ActorProvider provider = Provider.of<ActorProvider>(context, listen: false);
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     provider.getActors(provider.startingPage);
    //     provider.startingPage++;
    //   }
    // });
    //
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Actors'),
        backgroundColor: Colors.black,
      ),
      body: Consumer<ActorProvider>(
        builder: (buildContext, actorsprovider, _) {
          // ignore: unused_element
          return (actorsprovider.actors != null)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: screenSize.width / 3,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 185.0 / 278.0,
                  ),
                  controller: actorsprovider.scrollController,
                  itemCount: actorsprovider.actors.length,
                  itemBuilder: (context, index) {
                    final actor = actorsprovider.actors[index];
                    final id = index;
                    return GestureDetector(
                      child: Actors(
                        actor: actor,
                        index: id,
                      ),
                      onTap: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ActorDetailScreen(
                                  id: actor.id,
                                  title: actor.name,
                                )));
                      },
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }
}
