import 'package:flutter/material.dart';
import 'package:social_media_ui/models/user_model.dart';
import 'package:social_media_ui/widgets/custom_drawer.dart';
import 'package:social_media_ui/widgets/posts_carousel.dart';
import 'package:social_media_ui/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PageController _yourPostsPageController;
  PageController _favoritesPageController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _yourPostsPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    _favoritesPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 270.0,
                    width: double.infinity,
                    image: AssetImage(
                      widget.user.backgroundImageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    icon: Icon(Icons.menu),
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6.0),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 100.0,
                        width: 100.0,
                        fit: BoxFit.cover,
                        image: AssetImage(widget.user.profileImageUrl),
                      ),
                    ),
                  ),
                )
              ],
            ),Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                widget.user.name,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Followers',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PostsCarousel(
              pageController: _yourPostsPageController,
              title: 'Your Posts',
              posts: widget.user.posts,
            ),
            PostsCarousel(
              pageController: _favoritesPageController,
              title: 'Favorites',
              posts: widget.user.favorites,
            ),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
