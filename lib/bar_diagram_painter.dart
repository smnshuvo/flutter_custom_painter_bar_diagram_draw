import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarDiagramPainter extends CustomPainter{
  // TODO 1: Create horizontal line dividing the area in 5 sections
  // TODO 2: Take 5 random values, draw square box of them
  final _linePainter = Paint()
                    ..color= Colors.black
                    ..strokeWidth=0.2;
  final LINE_COUNT = 5;
  final _data = [10.0,20.0,30.0,40.0,50.0];
  late final double highestValue;

  BarDiagramPainter(){
    _setHighestValue();
  }

  @override
  void paint(Canvas canvas, Size size) {
    double originX = 0.0;
    double originY = size.height;
    for(int i=0;i<=LINE_COUNT;i++){
      originY = _getNextYAxisOrigin(size.height, lineNo: i, totalLines: LINE_COUNT);
      canvas.drawLine(Offset(originX, originY), Offset(size.width, originY), _linePainter);
    }
    _drawBars(canvas, size);
  }

  void _drawBars(Canvas canvas, Size size){
    final _barCount = _data.length;
    final _perBarSize = size.width/_barCount+1;
    double xAxis = _perBarSize;
    for(int i=0; i<_barCount;i++){
      _drawBar(xAxis - (_perBarSize/2), _getBarHeight(_data[i], size), canvas, size);
      xAxis+= _perBarSize;
    }

  }
  
  double _getBarHeight(double data, Size size){
    return size.height*_calculateMultiplyFactor(value: data);
  }

  void _drawBar(double xAxisStartingPoint, double height, Canvas canvas, Size size){
    final _barWidth = 40.0;
    final _leftSpan = xAxisStartingPoint - _barWidth/2;
    final _rightSpan = xAxisStartingPoint + _barWidth/2;

    final _rectStartingPoint = Offset(_leftSpan, size.height);
    final _rectEndingPoint = Offset(_rightSpan, size.height - height);
    Rect rect = Rect.fromPoints(_rectStartingPoint, _rectEndingPoint);


    final _barColor = Colors.green;
    final _barPaintBrush = Paint()..color = _barColor;
    canvas.drawRect(rect, _barPaintBrush);
  }

  void _setHighestValue(){
    _data.sort();
    highestValue = _data.last;
  }

  double _calculateMultiplyFactor({required double value}){
    return value/highestValue;
  }

  double _getNextYAxisOrigin(double canvasHeight, {required int lineNo, required int totalLines}){
    return canvasHeight - (canvasHeight / LINE_COUNT * lineNo);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}