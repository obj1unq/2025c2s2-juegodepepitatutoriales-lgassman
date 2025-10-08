import wollok.game.*
import randomizer.*

object manzanaFactory {
	method crear() {
		return new Manzana(position = randomizer.emptyPosition())
	}
}
object alpisteFactory {
	method crear() {
		return new Alpiste(position = randomizer.emptyPosition(), peso=40.randomUpTo(100).truncate(0))
	}
}


object comidas {
	const factories = [alpisteFactory,alpisteFactory, manzanaFactory]
	const enElTablero = #{}



	method comenzar() {
		game.onTick(3000, "COMIDAS", {self.nuevaComida()})
	}

	method maximo() {
		return 3
	}

	method nuevaComida() {
		if (enElTablero.size() < self.maximo()) {
			const comida = self.crearComida()
			game.addVisual(comida)
			enElTablero.add(comida)
		}
	}

	method crearComida() {
		return self.elegirFactory().crear()
	}
	
	method elegirFactory() {
		return factories.anyOne()
		
		// Para probabilidades raras
		// const probabilidad =  0.randomUpTo(1) 
		// if (probabilidad.between(0, 0.15)) {
		// 	return alpisteFactory
		// }
		// else if (probabilidad.between(0.15,0.65)) {
		// 	return manzanaFactory
		// }
		// else {
		// 	return milanesaFactory
		// }

	}

	method remover(comida) {
		if (enElTablero.contains(comida)){ //lo dejo con un if porque pepita podría comer cosas que no están en el tablero, por ejemplo en los tests
			enElTablero.remove(comida)
			game.removeVisual(comida)
		}
	}
}

class Manzana {

	const base= 5
	var madurez = 1
	const position
	
	
	method position() {
		return position
	}
	
	method image() {
		return "manzana.png"
	}

	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
		//madurez += 1
	}
    method atravesable() {
        return true
    }

	method colision(personaje) {
		personaje.comer(self)
	}
}

class Alpiste {

	const property position
	const peso 
	
	method image() {
		return "alpiste.png"
	}

	method text() {
		return peso.toString()
	}

	method energiaQueOtorga() {
		return peso
	} 
    method atravesable() {
        return true
    }

	method colision(personaje) {
		personaje.comer(self)
	}

}

