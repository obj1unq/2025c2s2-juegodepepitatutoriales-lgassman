import direcciones.*
import extras.*
import game

object ganadora {
	method nombre() {
		return "ganadora"
	}
	method puedeIr(siguientePosicion) {
		return false
	}
}
object perdedora {
	method nombre() {
		return "perdedora"
	}
	method puedeIr(siguientePosicion) {
		return false
	}
}
object libre {
	method nombre() {
		return "libre"
	}
	method puedeIr(siguientePosicion) {
		return tablero.dentro(siguientePosicion) and game.getObjectsIn(siguientePosicion).all({visual => visual.atravesable() })
	}
}


object pepita {
	var energia = 500
	
	const objetivo = nido
	const perseguidor = silvestre

	var property position = game.origin()
	
	method image() {
		return "pepita-" + self.estado().nombre() + ".png"
		// if (position == objetivo.position()) {
		// 	return "pepita-grande.png"
		// }
		// else {
		// 	return "pepita.png"
		// }
	}
	method text() {
		return energia.toString()
	}
	method textColor() {
		return "FF0000FF"
	}
	method estado() {
		if (position == objetivo.position()) {
			return ganadora
		}
		else if (position == perseguidor.position() or not self.puedeVolar(1)) {
			return perdedora
		}
		else {
			return libre
		}
	}

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method validarVolar(distancia){
		if (not self.puedeVolar(distancia)) {
			self.error("No puedo volar " + distancia)
		}
	}

	method volar(kms) {
		self.validarVolar(kms)
		energia = energia - self.energiaQueGasta(kms)
	}
	
	method energia() {
		return energia
	}

	method energiaQueGasta(distancia) {
		return  10 + distancia
	}

	method puedeVolar(distancia) {
		return self.energiaQueGasta(distancia) <= energia
	}

	method puedeMover(siguientePosicion) {
		return self.puedeVolar(1) and self.puedeIr(siguientePosicion) 
	}
	
	method puedeIr(siguientePosicion) {
		return self.estado().puedeIr(siguientePosicion)
	} 

	method validarMover(siguientePosicion){
		if (not self.puedeMover(siguientePosicion)) {
			self.error("No puedo ir ahí")
		}
	}

	method mover(direccion) {
		const siguientePosicion = direccion.siguiente(position)
		self.validarMover(siguientePosicion)
		self.volar(1)
		position = siguientePosicion
	}
	
	method caer() {
		const siguiente = abajo.siguiente(position)
		//para pensar: por que acá hago un if e ignoro mientras que en el mover valido y rompo?
		if (self.puedeIr(siguiente)) {
			position = siguiente
		}
	}


}

