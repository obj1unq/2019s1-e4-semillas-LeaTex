class Parcela {
	var ancho
	var largo
	var horasSolDiarias
	var plantas
	
	constructor(_ancho, _largo, _horas) {
		ancho = _ancho
		largo = _largo
		horasSolDiarias = _horas
		plantas = []
	}
	
	method superficie() { return ancho * largo }
	method plantas() { return plantas }
	method horasSolDiarias() { return horasSolDiarias }

	method cantidadMaximaPlantasPermitida() {
		if (ancho > largo) { return self.superficie() / 5 }
		else { return self.superficie() / 3 + largo }
	}
	
	method tieneComplicaciones() {
		return plantas.any({ p => p.horasToleranciaSol() < horasSolDiarias })
	}
	
	method plantar(unaPlanta) {
		if ((plantas.size() + 1) > self.cantidadMaximaPlantasPermitida()) { error.throwWithMessage("Se alcanzó la cantidad máxima de plantas permitidas.") }
		
		if (horasSolDiarias >= unaPlanta.horasToleranciaSol() + 2) { error.throwWithMessage("La parcela recibe al menos 2 horas más de sol que las toleradas por la planta.") }
		plantas.add(unaPlanta)
	}
	
	method esIdealParaPlanta(unaPlanta) {
		return unaPlanta.esParcelaIdeal(self)
	}
}
