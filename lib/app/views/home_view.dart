import 'package:conversor_curso/app/components/currency_box.dart';
import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {


  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  HomeController homeController;

  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();


  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png', width: 200, height: 200,),
              CurrencyBox(
                selectedItem: homeController.toCurrency,
                controller: homeController.toText,
                items: homeController.currencies,
                 onChanged: (model){
                   setState(() {
                     homeController.toCurrency = model;
                   });
                 },
                 ),
              SizedBox(height: 10,),
              CurrencyBox(
                selectedItem: homeController.fromCurrency,
                controller: homeController.fromText,
                items: homeController.currencies,
                 onChanged: (model){
                   setState(() {
                     homeController.fromCurrency = model;
                   });
                 },
              ),
              SizedBox(height: 30,),
              RaisedButton(
                color: Colors.amber,
                  onPressed: () {
                    homeController.convert();
                  },
                  child: Text('Converter'),)
            ],
            ),
        ),
      ),
    );
  }
}