import parcelas.*
import plantas.*

object inta {
	var parcelas = []

	
	method agregarParcela(unaParcela) {
		parcelas.add(unaParcela)
	}
	
	method promedioDePlantas() {
		if (parcelas.isEmpty()) { return 0 }
		else { return parcelas.sum({p => p.plantas().size() }) / parcelas.size() }		
	}

	method parcelaMasAutosustentable() {
		return parcelas.filter({p => p.plantas().size() > 4}).max({p => p.porcentajeDePlantasBienAsociadas() })
	}
}
