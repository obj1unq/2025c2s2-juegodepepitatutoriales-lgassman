import pepita.*
object nido {
    var property position = game.at(5,5)
    method image() = "nido.png"

    method atravesable() {
        return true
    }

    method colision(personaje) {
		personaje.ganar()
	}

}

object silvestre {
    const presa = pepita

    method image() = "silvestre.png"

    method position() {
        return game.at( presa.position().x().max(3), 0 )
    }

    method atravesable() {
        return true
    }

    method colision(personaje) {
		personaje.perder()
	}



}

object gravedad {

    const property cuerposLibres = #{} //podría solo trabajar con pepita, pero dejo preparado para que otras cosas puedan caerse, quizas los alimentos?
     
    method agregar(cuerpoLibre) {
        cuerposLibres.add(cuerpoLibre)
    }

    method eliminar(cuerpoLibre) {
        cuerposLibres.remove(cuerpoLibre)
    }

    method comenzar() {
        game.onTick(800, "GRAVEDAD", {cuerposLibres.forEach({cuerpoLibre => cuerpoLibre.caer()})})
    }
    method detener() {
        game.removeTickEvent("GRAVEDAD")
    }
}

class Muro {
    const property position

    method  image() {
        return "muro.png"
    }
    method atravesable() {
        return false
    }
}