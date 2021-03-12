import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  RatingStars(this.rating);

  @override
  Widget build(BuildContext context) {
    // String stars = '';
    // for (int i = 0; i < rating; i++) {
    //   stars += '⭐  ';
    // }
    // stars.trim();
    // return Text(
    //   stars,
    //   style: TextStyle(fontSize: 18.0),
    // );
    List<Widget> starList = [];
    for (int i = 0; i < rating; i++) {
      starList.add(Icon(Icons.star, color: Theme.of(context).primaryColor,));
    }
    return Row(
      children: starList,
    );
  }
}

// typedef void RatingChangeCallback(double rating);

// class RatingStars extends StatelessWidget {
//   final int starCount;
//   final double rating;
//   final RatingChangeCallback onRatingChanged;
//   final Color color;

//   RatingStars(
//       {this.rating, this.starCount = 5, this.onRatingChanged, this.color});

//   Widget buildStar(BuildContext context, int index) {
//     Icon icon;
//     if (index >= rating) {
//       icon = new Icon(
//         Icons.star_border,
//         color: Theme.of(context).buttonColor,
//       );
//     } else if (index > rating - 1 && index < rating) {
//       icon = new Icon(
//         Icons.star_half,
//         color: color ?? Theme.of(context).primaryColor,
//       );
//     } else {
//       icon = new Icon(
//         Icons.star,
//         color: color ?? Theme.of(context).primaryColor,
//       );
//     }
//     return new InkResponse(
//       onTap:
//           onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
//       child: icon,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Row(
//         children:
//             new List.generate(starCount, (index) => buildStar(context, index)));
//   }
// }

// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => new _TestState();
// }

// class _TestState extends State<Test> {
//   double rating = 3.5;

//   @override
//   Widget build(BuildContext context) {
//     return new StarRating(
//       rating: rating,
//       onRatingChanged: (rating) => setState(() => this.rating = rating),
//     );
//   }
// }
