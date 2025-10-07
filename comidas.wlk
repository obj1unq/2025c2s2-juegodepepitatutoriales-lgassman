import wollok.game.*

object manzana {

		

	const base= 5
	var madurez = 1
	
	method position() {
		return game.at(8,8)
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

object alpiste {

	method position() {
		return game.at(3,8)
	}
	
	method image() {
		return "alpiste.png"
	}

	method energiaQueOtorga() {
		return 20
	} 
    method atravesable() {
        return true
    }

	method colision(personaje) {
		personaje.comer(self)
	}

}

