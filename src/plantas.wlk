class Planta {
	var anioObtencionSemilla
	var altura

	constructor (_anio, _altura) {
		anioObtencionSemilla = _anio
		altura = _altura
	}

	method esFuerte() {
		return self.horasToleranciaSol() > 10
	}
	method daNuevasSemillas() {
		return self.esFuerte() or self.condicionDaNuevasSemillas()
	}
	method horasToleranciaSol()
	method espacioOcupado()
	method condicionDaNuevasSemillas()
	
}

class Menta inherits Planta {

	override method horasToleranciaSol() { return 6 }
	override method espacioOcupado() { return altura * 3 }
	override method condicionDaNuevasSemillas() { return altura > 0.4 }
	
}

class Hierbabuena inherits Menta {
	override method espacioOcupado() { return super() * 2 }
}

class Soja inherits Planta {

	override method horasToleranciaSol() {
		if (altura < 0.5) { return 6 }
		else if (altura >= 0.5 and altura <= 1) { return 7}
		else { return 9 }
	}
	override method espacioOcupado() { return altura / 2 }
	override method condicionDaNuevasSemillas() { return anioObtencionSemilla > 2007 and altura > 1 }

}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() { return false }
}
class Quinoa inherits Planta {

	var horasToleranciaSol
	
	constructor (_anio, _altura, _horas) = super(_anio, _altura) {
		horasToleranciaSol = _horas
	}
	override method horasToleranciaSol() { return horasToleranciaSol }
	override method espacioOcupado() { return 0.5 }
	override method condicionDaNuevasSemillas() { return anioObtencionSemilla < 2005 }
	
}
