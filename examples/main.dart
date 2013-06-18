import 'dart:html';
import 'dart:async';
import 'dart:math';

import 'package:range_slider/rangeslider.dart';

void main() {
  
  for (Element $elmt in queryAll("div")) {
    new RangeSlider($elmt);
    LabelElement $label = new LabelElement();
    $label.text = $elmt.attributes["value"];
    $elmt.parent.insertBefore($label, $elmt.nextElementSibling);
    
    $elmt.onChange.listen((Event evt) {
      $label.text = evt.detail["value"].toString();
    });
    
    new EventStreamProvider("commit").forTarget($elmt).listen((Event evt) {
      $label.text = "COMMIT: ${evt.detail["value"].toString()}";
    });
  }
}