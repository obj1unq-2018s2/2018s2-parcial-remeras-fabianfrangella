class RemeraLisa {

	var color // String
	var talle // Numero
	var coloresBasicos = #{ "Blanco", "Negro", "Gris" }
	var costoRemeraChica = 80
	var costoRemeraGrande = 100
	method color() = color

	method talle() = talle

	method esDeColorBasico() = coloresBasicos.contains(color)

	method costoSegunRango() {
		if (talle.between(32, 40)) {
			return self.costoRemeraChica()
		} else {
			return self.costoRemeraGrande()
		}
	}
	method costoRemeraChica() = costoRemeraChica
	method cambiarCostoChica(nuevoCosto) {
		costoRemeraChica = nuevoCosto
	}
	method costoRemeraGrande() = costoRemeraGrande
	method cambiarCostoRemeraGrande(nuevoCosto){
		costoRemeraGrande = nuevoCosto
	}
	method porcentajeDeDescuento() = 0.10
	
	method costo() {
		if (self.esDeColorBasico()) {
			return self.costoSegunRango()
		} else {
			return self.costoSegunRango() * 0.10
		}
	}
	
	method esDeMarca() = false // TODO ???

}

class RemeraBordada inherits RemeraLisa {

	var cantColores // numero

	override method porcentajeDeDescuento() = 0.02
	method costoMinimo() = 20

	method precioPorBordado() = if (cantColores * 10 < self.costoMinimo()) 20 else cantColores * 10

	override method costo() {
		return super() + self.precioPorBordado()
	}
	override method esDeMarca() = false
	
}

class RemeraSublimada inherits RemeraLisa {

	var dibujoSublimado // instancia de la clase DibujoSublimado

	method precioPorSublimado() {
		return dibujoSublimado.precio()
	}

	override method costo() {
		return super() + self.precioPorSublimado()
	}
	
	override method porcentajeDeDescuento() = 0.10
	
	override method esDeMarca() = true // TODO No todas las remeras sublimadas tienen marca, debería delegar en dibujo.
	
	method descuentoPorAcuerdo() = dibujoSublimado.descuentoPorAcuerdo()
	
	method marca() = dibujoSublimado.empresa()
}

class DibujoSublimado {

	var alto
	var ancho
	var property empresa // instancia de la clase empresa o null

	method esPropiedadDeUnaEmpresa() = empresa != null

	method precioPorPropiedad() = if (self.esPropiedadDeUnaEmpresa()) empresa.precioPorCopyRight() else 0

	method alto() = alto

	method ancho() = ancho

	method precioPorSuperficie() = alto * ancho * 0.5
	
	method precio() {
		return self.precioPorSuperficie() + self.precioPorPropiedad()
	}

	method descuentoPorAcuerdo() = if (self.esPropiedadDeUnaEmpresa()) empresa.descuentoPorAcuerdo() else 0
}

class Empresa {

	var precioPorCopyRight

	method precioPorCopyRight() = precioPorCopyRight
	method descuentoPorAcuerdo() = 0.20
}

