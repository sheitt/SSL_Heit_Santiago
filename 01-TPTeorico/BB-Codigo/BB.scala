import scala.annotation.tailrec

object BusquedaBinariaFuncional extends App {

  def busquedaBinaria(arreglo: Array[Int], elementoBuscado: Int): Option[Int] = {
    
    @tailrec
    def buscar(inicio: Int, fin: Int): Option[Int] = {
      if (inicio > fin) {
        None // Caso base: Elemento no encontrado
      } else {
        val medio = inicio + (fin - inicio) / 2
        
        arreglo(medio) match {
          case valor if valor == elementoBuscado => Some(medio) // Encontrado
          case valor if valor < elementoBuscado  => buscar(medio + 1, fin) // Mitad derecha
          case _                                 => buscar(inicio, medio - 1) // Mitad izquierda
        }
      }
    }

    buscar(0, arreglo.length - 1)
  }

  // Ejemplo de uso:
  val datos = Array(2, 5, 8, 12, 16, 23, 38, 56, 72, 91)
  val objetivo = 23

  val inicio = System.nanoTime()

  val resultado = busquedaBinaria(datos, objetivo)

  val fin = System.nanoTime()

  resultado match {
  case Some(indice) =>
    println(s"Elemento encontrado en el índice: $indice")
  case None =>
    println("Elemento no encontrado")
  }

  println(s"Tiempo: ${(fin - inicio) / 1000000.0} ms")
}