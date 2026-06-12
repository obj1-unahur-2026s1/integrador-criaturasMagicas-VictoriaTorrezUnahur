class Colonias {
  const criaturas = []
  method habitantes() = criaturas 
  method añadirCriaturas(lista) {
    criaturas.addAll(lista)
  } 
  method lucharContraColoniaAtacante(unColoniaEnemiga) {
    if(self.poderDefensivoColonia() < unColoniaEnemiga.poderDefensivoColonia()){
        criaturas.clear()
        criaturas.addAll(unColoniaEnemiga.habitantes())
    } else {
        unColoniaEnemiga.pierdenPoderMagico()
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
