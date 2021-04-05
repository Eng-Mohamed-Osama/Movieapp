import 'package:movieapp2/UI/actors_details/actor_details_widget.dart';
import 'actor_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActorDetailScreen extends StatelessWidget {
  ActorDetailScreen({Key key, this.title, this.id}) : super(key: key);

  final String title;
  final int id;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            backgroundColor: Colors.black,
          ),
          body: ChangeNotifierProvider<ActorDetailsProvider>(
            create: (context) => ActorDetailsProvider(id),
            child: Consumer<ActorDetailsProvider>(
              builder: (buildContext, actorDetailsRepository, _) {
                final actorDetails = actorDetailsRepository.actorsInfo;
                final actorImages = actorDetailsRepository.actorProfileImages;
                return (actorDetailsRepository.actorsInfo != null &&
                        actorImages.profiles != null)
                    ? ActorDetailWidget(
                        actorsInfo: actorDetails,
                        actorProfileImages: actorImages,
                        index: id,
                      )

                    // })
                    : Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ));
  }
}
