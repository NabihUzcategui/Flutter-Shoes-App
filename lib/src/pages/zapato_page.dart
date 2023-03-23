import 'package:flutter/material.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import '../widgets/widgets.dart';

class ZapatoPage extends StatelessWidget {
  const ZapatoPage({super.key});
 
  @override
  Widget build(BuildContext context) {

    cambiarStatusDark();

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(texto: 'For You'),
          const SizedBox( height: 15,),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [

                  Hero(
                    tag: 'zapato-1',
                    child: ZapatoSizePreview()
                  ),
            
                  ZapatoDescripcion(
                  titulo: 'Nike Air Max 720', 
                  descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."
                  ),
                ],
              ),
            )
          ),

          const AgregarCarritoBoton(monto: 180.0)
        ],
      ),
    );
  }
}