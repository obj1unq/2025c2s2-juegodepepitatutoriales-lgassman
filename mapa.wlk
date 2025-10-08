import extras.*
import pepita.*
object _{
    method dibujar(position) {

    }
}

object m{
    method dibujar(position) {
        game.addVisual(new Muro(position=position))
    }

}

object n{
    method dibujar(position) {
        nido.position(position)
        game.addVisual(nido)
    }

}

object p{
    
    method dibujar(position) {
        pepita.position(position)
    }
        
}

object s{
    method dibujar(position) {
        game.addVisual(silvestre)        
    }
}

object mapa {

    const dibujo =[
        [ _, _, _, m, _, _, n, _, _, _ ],
        [ _, _, _, m, _, _, _, _, _, _ ],
        [ s, _, _, m, _, _, _, _, _, _ ],
        [ _, _, _, m, _, _, _, _, _, _ ],
        [ _, _, _, m, m, m, _, _, _, _ ],
        [ _, _, _, _, _, _, _, _, _, _ ],
        [ _, _, _, m, m, _, _, _, _, _ ],
        [ p, _, _, _, _, _, _, _, _, _ ],
        [ _, _, _, _, _, _, _, _, _, _ ]
    ].reverse() //Es necesario el reverse porque el y=0 en realidad corresponde a la altura mas alta

    method construir() {
        game.height(dibujo.size()) //configuro el alto segun la cantidad de filas del dibujo
        game.width(dibujo.anyOne().size()) //configuro el ancho segun la cantidad de columnas del dibujo
        //itero por el ancho y luego por el alto.
        (0 .. game.width() - 1).forEach({ x => 
            (0 .. game.height() - 1).forEach({y => 
                dibujo.get(y).get(x).dibujar(game.at(x,y))  //obtengo el dibujante de la cordenada que corresponde a la iteracion y le pido que dibuje en esa cordenada
            })
        })
        game.addVisual(pepita)

    }





}
