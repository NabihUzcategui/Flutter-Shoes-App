import 'package:flutter/material.dart';

class ZapatoDescripcion extends StatelessWidget {


  final String titulo;
  final String descripcion;

  const ZapatoDescripcion({
    super.key, 
    required this.titulo, 
    required this.descripcion
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox( height: 20,),
          Text(titulo, style: const TextStyle( fontWeight:FontWeight.bold, fontSize: 30),),
          const SizedBox( height: 20,),
          Text(descripcion, style: const TextStyle( color: Colors.black54, height: 1.6),)
        ],
      ),
    );
  }
}