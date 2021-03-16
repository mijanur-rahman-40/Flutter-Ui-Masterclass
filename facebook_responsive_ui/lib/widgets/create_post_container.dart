import 'package:facebook_responsive_ui/models/models.dart';
import 'package:facebook_responsive_ui/widgets/widgets.dart';

import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  Widget _getHomeTextIconButton({Function onPressed, Icon icon, String label}) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label),
      style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 15.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
          : null,
      child: Container(
        padding: EdgeInsets.fromLTRB(12.0, isDesktop ? 15.0 : 5.0, 12.0, 0.0),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                      hintText: 'What\'s on your mind?',
                      border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(35.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Divider(height: 15.0, thickness: 0.5),
            Container(
              height: 40.0,
              margin: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _getHomeTextIconButton(
                      onPressed: () {},
                      icon: Icon(Icons.videocam, color: Colors.red),
                      label: 'Live'),
                  const VerticalDivider(width: 8.0),
                  _getHomeTextIconButton(
                      onPressed: () {},
                      icon: Icon(Icons.photo_library, color: Colors.green),
                      label: 'Photo'),
                  const VerticalDivider(width: 8.0),
                  _getHomeTextIconButton(
                      onPressed: () {},
                      icon: Icon(Icons.video_call, color: Colors.purpleAccent),
                      label: 'Room'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
