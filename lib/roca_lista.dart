import 'package:flutter/material.dart';
import 'package:mas_roca/Product.dart';

import 'roca_tarjeta.dart';
import 'roca_modelo.dart';

class RocaList extends StatelessWidget {
  // Builder methods rely on a set of data, such as a list.
  final List<Product> rocas;
  RocaList(this.rocas);

  // First, make your build method like normal.
  // Instead of returning Widgets, return a method that returns widgets.
  // Don't forget to pass in the context!
  @override
  Widget build(BuildContext context) {
    print(rocas);
    return _buildList(context);
  }

  // A builder method almost always returns a ListView.
  // A ListView is a widget similar to Column or Row.
  // It knows whether it needs to be scrollable or not.
  // It has a constructor called builder, which it knows will
  // work with a List.

  ListView _buildList(context) {
    return ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: rocas.length,
      // A callback that will return a widget.
      itemBuilder: (context, int) {
        // In our case, a DogCard for each doggo.
        print('roca_list.dart');
        print('Nombre: ${rocas[int]}, ');
        return RoCard(rocas[int]);
      },
    );
  }
}