import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/image_tile.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:NestedScrollView(headerSliverBuilder: (context,innerBoxIsScrolled){
        return [
          //Image Slider
          SliverAppBar(
            expandedHeight: 320,
            flexibleSpace: FlexibleSpaceBar(
              background: PageView.builder(
                  itemCount: 5,
                  itemBuilder: (context,index){
                return CachedNetworkImage(imageUrl:'https://picsum.photos/500/500?random=slide_$index');
              }),
            ),
          ),
           // Search Button
          SliverAppBar()
        ];
      },
      body: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        itemBuilder: (context, index) {
          return ImageTile(imageSource: 'https://picsum.photos/500/500?random=img_$index', index: index, extent: (index %2)==0 ? 300 :150);
        },
      ),

          )
    );
  }
}
