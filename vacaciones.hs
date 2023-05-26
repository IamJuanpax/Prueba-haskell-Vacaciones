{--

De cada turista nos interesa:
Sus niveles de cansancio y stress
Si está viajando solo
Los idiomas que habla

Ana: está acompañada, sin cansancio, tiene 21 de stress y habla español.
Beto y Cathi, que hablan alemán, viajan solos, y Cathi además habla catalán. Ambos tienen 15 unidades de cansancio y stress.

--}

{--

2) Modelar las excursiones anteriores de forma tal que para agregar una excursión al sistema no haga falta modificar las funciones existentes. Además:
    a) Hacer que un turista haga una excursión. Al hacer una excursión, el turista además de sufrir los efectos propios de la excursión, reduce en un 10% su stress.

    b) Dada la función 

deltaSegun :: (a -> Int) -> a -> a -> Int
deltaSegun f algo1 algo2 = f algo1 - f algo2

Definir la función deltaExcursionSegun que a partir de un índice, un turista y una excursión determine cuánto varió dicho índice después de que el turista haya hecho la excursión. Llamamos índice a cualquier función que devuelva un número a partir de un turista.
Por ejemplo, si “stress” es la función que me da el stress de un turista:
> deltaExcursionSegun stress ana irALaPlaya
-3     -- porque al ir a la playa Ana queda con 18 de estrés (21 menos 1 menos 10% de 20)

    c) Usar la función anterior para resolver cada uno de estos puntos:
Saber si una excursión es educativa para un turista, que implica que termina aprendiendo algún idioma.
Conocer las excursiones desestresantes para un turista. Estas son aquellas que le reducen al menos 3 unidades de stress al turista.



--}

data Turista = UnTurista{
    nombre :: String,
    nivelEstres :: Number,
    nivelCansancio :: Number,
    viajaSolo :: Bool,
    idiomas :: [String]
} Show

data Oceano = UnOceano{
    marea :: String
}

type ElementoPaisaje = String
type Idioma = String
type Tiempo = Number

--------- Turistas --------

ana = UnTurista "Ana" 21 0 _ ["Español"]
beto = UnTurista "Beto" 15 15 True ["Aleman"]
cathi = UnTurista "Cathi" 15 15 True ["Aleman", "Catalan"]

--------- Funciones de excursiones --------

irPlaya :: Turista -> Turista
irPlaya turista
    | viajaSolo turista == True = turista {nivelCansancio = nivelCansancio - 5}
    | otherwise = turista {nivelEstres = nivelEstres - 1}

apreciarElementoDePaisaje :: Turista -> ElementoPaisaje -> Turista
apreciarElementoDePaisaje turista elemento = turista {nivelEstres - (length elemento)}

salirHablarIdioma :: Turista -> Idioma -> Turista
salirHablarIdioma turista idioma = turista {concat idiomas idioma}

caminar :: Turista -> Tiempo -> Turista
caminar turista tiempo = turista {nivelCansancio = nivelCansancio + (tiempo/4), nivelEstres = nivelEstres - (tiempo/4)}

paseoEnBarco :: Turista -> Oceano -> Turista
paseoEnBarco turista oceano
    | marea oceano == "fuerte" = turista {nivelEstres ++ 6, nivelCansancio = ++ 10}
    | marea oceano == "tranquila" = caminar turista 10, apreciarElementoDePaisaje turista "mar", salirHablarIdioma turista "Aleman"



deltaExcursionSegun ::
deltaExcursionSegun


------- Funciones de ayuda -------

reducirDiezEstres :: Turista -> Turista
reducirDiezEstres turista = turista {nivelEstres = nivelEstres*(0,90)}    -- Aplicar a cada turista que realiza una excursion --



funcionA algo1 algo2 = algo1

funcionB algo3 algo4 = algo4

FuncionC algo1 algo3
    | algo1 == "Manteca" = funcionA algo1 algo3, funcionB algo3 algo1
    | otherwise = "No se"

