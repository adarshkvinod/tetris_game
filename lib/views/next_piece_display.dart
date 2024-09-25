import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import '../entities/piece.dart';

class NextPieceDisplay extends StatelessWidget {
  final Piece? piece;

  const NextPieceDisplay({Key? key, required this.piece}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (piece == null) return Container(); // Handle case when there's no next piece

    return Column(
      mainAxisSize: MainAxisSize.min,  // Ensure column doesn't take too much space
      children: [

        SizedBox(
          height: 50.dp,  // Small height for the next piece area
          width: 50.dp,   // Ensure the grid is square
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,  // Fixed 4 columns for the piece
            ),
            itemCount: 16,  // 4x4 grid cells
            itemBuilder: (context, index) {
              final x = index % 4;
              final y = index ~/ 4;
              final color = _getColorForNextPiece(x, y);

              return Container(
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: color ?? Colors.transparent,
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Helper function to check if a part of the next piece should be colored
  Color? _getColorForNextPiece(int x, int y) {
    if (piece == null) return null;
    for (final position in piece!.positions) {
      if (position.x == x && position.y == y) {
        return piece!.color;
      }
    }
    return null;
  }
}
