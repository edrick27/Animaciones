import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class NavegacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notifications Page')
        ),

      floatingActionButton: _BotonFlotante(),

      bottomNavigationBar: _BottomNavigation()
   ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  
  _BottomNavigation() ;

  @override
  Widget build(BuildContext context) {

    final int numero = Provider.of<_NotificationModel>(context).numero;
    
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text('Bones'),
          icon: FaIcon(FontAwesomeIcons.bone)
        ),
        BottomNavigationBarItem(
          title: Text('Notifications'),
          icon: Stack(
            children: <Widget>[
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0.0,
                right: -0.5,
                // child: Icon(
                //   Icons.brightness_1,
                //   size: 8,
                //   color: Colors.redAccent,
                // ),
                child: BounceInDown(
                  from: 10,
                  animate: (numero > 0) ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                    child: Container(
                      child: Text('$numero', style: TextStyle( color: Colors.white , fontSize: 9, fontWeight: FontWeight.w500   )),
                      alignment: Alignment.center,
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ),
        BottomNavigationBarItem(
          title: Text('My dog'),
          icon: FaIcon(FontAwesomeIcons.dog)
        )
      ]
    );
  }
  
}

class _BotonFlotante extends StatelessWidget {


  _BotonFlotante();

  @override
  Widget build(BuildContext context) {
   
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
      onPressed: (){

        final provider = Provider.of<_NotificationModel>(context, listen: false);

        int numero = provider.numero;

        numero++;

        provider.numero = numero;

        if(numero >= 2){
          provider.bounceController.forward( from: 0.0 );
        }
      }
    );

  }
}

class _NotificationModel extends ChangeNotifier {

  int _numero = 0;

  AnimationController _bounceController;


  int get numero => _numero;


  set numero(int value) {
    _numero = value;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController;

  set bounceController(AnimationController controller) {
    _bounceController = controller;
    notifyListeners();
  }

}