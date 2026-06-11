class Criaturas {
  var property astucia  
  var property poderMagico 
  var property rolActual
  method poderOfensivo() = poderMagico * 10 + rolActual.poderExtra()
  method esFromidable() = self.esAstuta() or self.esExtraordinario()
  method esAstuta()
  method esExtraordinario() = self.rolActual().rolExtraordinario(self)
  method cambiarARol() {
     rolActual.realizarRitual(self)
  }  

}
class Duendes inherits Criaturas {
  override method poderOfensivo() = super() + super()/10
  override method esAstuta() = false
}
class Hadas inherits Criaturas {
  var kilometrosDeVuelo = 2
  method volar(kilometros) {
    kilometrosDeVuelo = (kilometrosDeVuelo + kilometros).min(25)
  }
  override method esAstuta() = astucia > 50
  override method esExtraordinario() = super() and kilometrosDeVuelo > 10
}
