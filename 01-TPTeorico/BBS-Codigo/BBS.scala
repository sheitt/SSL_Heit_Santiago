object BBS {

  def bubbleSort(vector: Array[Int]): Unit = {
    val cantidad = vector.length

    for (pasada <- 0 until cantidad - 1) {
      for (indice <- 0 until cantidad - 1 - pasada) {
        if (vector(indice) > vector(indice + 1)) {
          val temporal = vector(indice)
          vector(indice) = vector(indice + 1)
          vector(indice + 1) = temporal
        }
      }
    }
  }

  def main(args: Array[String]): Unit = {

    val cantidad = 1000

    val vector = Array.ofDim[Int](cantidad)

    for (indice <- 0 until cantidad) {
      vector(indice) = cantidad - indice
    }

    val inicio = System.nanoTime()

    bubbleSort(vector)

    val fin = System.nanoTime()

    println(s"Tiempo: ${(fin - inicio) / 1000000.0} ms")
  }
}