import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingRow extends StatefulWidget {
  const RatingRow({Key? key, this.size = 30})
      : _isViewOnly = true,
        onPressed = null,
        super(key: key);
  const RatingRow.interact({required this.onPressed, this.size = 30})
      : _isViewOnly = false; //For interacting with tap
  final void Function(double)? onPressed;
  final bool _isViewOnly;
  final double size;
  @override
  State<RatingRow> createState() => RatingRowState();
}

class RatingRowState extends State<RatingRow> {
  double _rating = 4;
  @override
  Widget build(BuildContext context) {
    if (widget._isViewOnly)
      return RatingBarIndicator(
          itemCount: 5,
          rating: _rating,
          itemSize: widget.size,
          unratedColor: Theme.of(context).primaryColor,
          itemBuilder: _buildStars);
    return RatingBar.builder(
        maxRating: 5,
        minRating: 1,
        initialRating: _rating,
        itemSize: widget.size,
        allowHalfRating: true,
        updateOnDrag: true,
        unratedColor: Theme.of(context).primaryColor,
        itemBuilder: _buildStars,
        onRatingUpdate: (rating) {
          print(rating);
          setState(() {
            _rating = rating;
          });
        });
  }

  Widget _buildStars(context, index) {
    if (index >= _rating) {
      return Icon(
        Icons.star_border,
      );
    }
    if (_rating.toInt() < _rating && _rating.toInt() == index)
      return Icon(
        Icons.star_half,
        color: Colors.amber,
      );
    return Icon(
      Icons.star,
      color: Colors.amber,
    );
  }
}
