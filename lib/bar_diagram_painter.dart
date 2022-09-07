import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarDiagramPainter extends CustomPainter{
  // TODO 1: Create horizontal line dividing the area in 5 sections
  // TODO 2: Take 5 random values, draw square box of them
  final _painter = Paint()
                    ..color= Colors.black
                    ..strokeWidth=0.2;
  final LINE_COUNT = 5;
  @override
  void paint(Canvas canvas, Size size) {
    double originX = 0.0;
    double originY = size.height;
    for(int i=1;i<=LINE_COUNT;i++){
      originY = _getNextYAxisOrigin(size.height, lineNo: i, totalLines: LINE_COUNT);
      canvas.drawLine(Offset(originX, originY), Offset(size.width, originY), _painter);

    }

  }

  double _getNextYAxisOrigin(double canvasHeight, {required int lineNo, required int totalLines}){
    return canvasHeight - (canvasHeight / LINE_COUNT * lineNo);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}