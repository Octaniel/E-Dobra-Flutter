import 'package:edobra/app/widgets/custom_drawer.dart';

import '../controllers/pagar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagarPage extends GetView<PagarController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text('PagarPage '),
      centerTitle: true,),
      body: Center(
        child: Text('PagarScreen  is working', style: TextStyle(fontSize:20),),
      ),
    );
  }
}
