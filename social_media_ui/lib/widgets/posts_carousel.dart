import 'package:flutter/material.dart';

import 'package:social_media_ui/models/post_model.dart';

class PostsCarousel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts;

  PostsCarousel({
    this.pageController,
    this.title,
    this.posts,
  });
  _buildPost(BuildContext context, int index) {
    Post post = posts[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, Widget child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * .25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 360,
            child: child,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                height: 350.0,
                width: 260.0,
                image: AssetImage(
                  post.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Container(
              padding: EdgeInsets.all(10.0),
              height: 120.0,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    post.location,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          SizedBox(width: 5),
                          Text(
                            post.likes.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.comment,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(width: 5),
                          Text(
                            post.comments.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 400.0,
          child: PageView.builder(
              controller: pageController,
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildPost(
                  context,
                  index,
                );
              }),
        ),
      ],
    );
  }
}
