// ValueNotifier: hold the data 
// ValueListenableBuilder: Listen to the data (dont need setState)

import 'package:flutter/material.dart';

ValueNotifier selectedPageNotifier = ValueNotifier(0);
ValueNotifier isDarkModeNotifier = ValueNotifier(true); 