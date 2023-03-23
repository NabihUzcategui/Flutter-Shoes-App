import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/pages/zapato_desc_page.dart';
import '../models/zapato_model.dart';

class ZapatoSizePreview extends StatelessWidget {

  final bool fullScreen;

  const ZapatoSizePreview({
    super.key, 
    this.fullScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if ( !fullScreen ) {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric( 
          horizontal: (fullScreen) ? 5 : 30, 
          vertical: (fullScreen) ? 5 : 0
        ),
        child: Container(
          width: double.infinity,
          height: (fullScreen) ? 410 : 430,
          decoration: BoxDecoration(
            color: const Color(0xffffcf53),
            borderRadius: 
              (!fullScreen) 
              ? BorderRadius.circular(50)
              : const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )
          ),
    
          child: Column(
            children: [
    
              //zapato y la sombra
              _ZapatoConSombra(),
    
              //todo: tallas
              if (!fullScreen)
                _ZapatoConTallas(),
              
            ],
          ),
        ),
      ),
    );
  }
}


class _ZapatoConTallas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
    
        children: const [
    
          _BoxTalla(numero: 7),
          _BoxTalla(numero: 7.5),
          _BoxTalla(numero: 8),
          _BoxTalla(numero: 8.5),
          _BoxTalla(numero: 9),
          _BoxTalla(numero: 9.5),
        ],
      ),
    );
  }
}

class _BoxTalla extends StatelessWidget {
  
  final double numero;

  const _BoxTalla({
    required this.numero
  });

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);    
    
    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel.talla = numero;  
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: (numero == zapatoModel.talla) ? const Color(0xfff1a23a) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if( numero == zapatoModel.talla)
                const BoxShadow(
                  color: Color(0xfff1a23a),
                  blurRadius: 10,
                     offset: Offset(0, 5)
                )
          ]
    
        ),
        child: Text(numero.toString().replaceAll('.0', ''), 
          style: TextStyle(
          color: (numero == zapatoModel.talla) ? Colors.white : const Color(0xfff1a23a),
          fontSize: 16,
          fontWeight: FontWeight.bold
        )),
      ),
    );
  }
}


class _ZapatoConSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: const EdgeInsets.all(35),
      child: Stack(
        children: [
          
          Positioned(
            right: 0,
            bottom: 20,
            child: _SombraZapato()
          ),
    
          Image(image: AssetImage( zapatoModel.assetImage)),
        ],
      ),
    );
  }
}

class _SombraZapato extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.6,
      child: Container(
        width: 240,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const[
            BoxShadow(
              color: Color(0xffeaa14e),
              blurRadius: 40,
            )
          ]
    
        ),
      ),
    );
  }
}