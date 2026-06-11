object guardian {
  method poderExtra() = 100     
  method rolExtraordinario(deUnaCriatura) = deUnaCriatura.poderMagico() > 50 
   method realizarRitual(criatura) {
    const nuevaMascota = new Mascota(edad = 1, tieneCuernos = false)
    domador.añadirCriatura(nuevaMascota)
    criatura.rolActual(domador)
  } 
}
object hechicero {
  method poderExtra() = 0
  method rolExtraordinario(deUnaCriatura) = true
  method realizarRitual(criatura) {
    criatura.rolActual(guardian)
  } 
}
object domador {
  const mascotas = [] 
  method añadirCriatura(una) {
    mascotas.add(una)
  }
  
     method cantDeMascotas() = mascotas.size()

  method poderExtra() = mascotas.count({m=>m.tieneCuernos()}) * 150 
  method rolExtraordinario(deUnaCriatura) = deUnaCriatura.poderMagico() >= 15 and mascotas.all({m=>m.esVeterana()})
  method realizarRitual(criatura) {
    if(mascotas.any({m=>m.tieneCuernos()})){
    criatura.rolActual(hechicero)
    } else {
      self.error("ritual cancelado")
    }
  } 
 }

class Mascota {
  var property edad 
  var tieneCuernos
  method esVeterana() = edad >= 10 
  method noTieneCuernos() {
    tieneCuernos = false
  }
  method contieneCuernos() {
    tieneCuernos = true
  }
  method tieneCuernos() = tieneCuernos
  method puedeSerDomado() = true   
}