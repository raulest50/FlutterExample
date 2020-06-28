Inicialmente queria rehacer la app con dart y flutter. las ventajas de esto era un desarrollo mas rapido y compatibilidad android y iOS. sin embargo la deteccion automatica de servidor no funciono ni con las las librerias de udp dart ni con las de multicast-dns. aunque flutter tiene caracteristicas que me gustaron, el soporte, libreiras e informacion disponible simplemente no es suficiente, todos las librerias se usaban tal cual como en los ejemplos de la documentacion y siempre habia un error en ejecucion.

por este motivo decidi regresar a android nativo con java, que tiene una gran madurez y no es que vaya a quedar obsoleto tampoco. flutter es una buena opcion si es necesario que funcione en ambos sistemas operativos, pero si el desarrollo es solo android es mejor usar nativo.

ademas una app de flutter pesa mucho mas que una nativa, mientras que un simple ejemplo puede pesar 60Mb en android nativo lo mismo puede psar 4Mb.

La deteccion automatica de servidor usando udp broadcast funciono en un solo dia con android nativo.
este proyecto lo guardo a manera de ejemplo para un futuro en el que sea necesario retomar el desarrollo en flutter.

cuando se va a instalar una libreria el equivalente de npm es pub y se instala agregando al archivo pub spec y luego usando el comando get.
