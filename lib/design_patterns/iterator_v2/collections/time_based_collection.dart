import 'package:flutter_solid/design_patterns/iterator_v2/collections/my_collection.dart';
import 'package:flutter_solid/design_patterns/iterator_v2/iterators/my_iterator.dart';
import 'package:flutter_solid/design_patterns/iterator_v2/iterators/closest_distance_iterator.dart';
import 'package:flutter_solid/design_patterns/iterator_v2/iterators/urgent_iterator.dart';
import 'package:flutter_solid/design_patterns/iterator_v2/models/address.dart';
import 'package:flutter_solid/design_patterns/iterator_v2/models/delivery.dart';
import 'package:flutter_solid/design_patterns/iterator_v2/models/purchase.dart';

class TimeBasedCollection implements MyCollection<Purchase> {
  final Delivery delivery;

  TimeBasedCollection(this.delivery);

  @override
  MyIterator<Purchase> createIterator() {
    return TimeBasedIterator(delivery);
  }
}
