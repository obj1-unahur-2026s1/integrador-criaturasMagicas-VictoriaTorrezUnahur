class Colonias {
  const criaturas = []
  method añadirCriaturas(lista) {
    criaturas.addAll(lista)
  } 
  method puedeConquistarNuestraArea(unColoniaEnemiga) {
    if(self.poderDefensivoColonia() < unColoniaEnemiga.poderDefensivoColonia()){
        return false
    } else {
        return self.pierdenPoderMagico()
    }
  } 
  method pierdenPoderMagico() = criaturas.sum({c=>c.poderMagico()}) *0.85 
  method poderOfensivoColonia() = criaturas.sum({c=>c.poderOfensivo()})
  method poderDefensivoColonia() 
}
class LosClaros inherits Colonias {
  override method poderDefensivoColonia() = self.poderDefensivoColonia() + 100
}
class LosCastillos inherits Colonias {
  override method poderDefensivoColonia() = criaturas.size()*200
}