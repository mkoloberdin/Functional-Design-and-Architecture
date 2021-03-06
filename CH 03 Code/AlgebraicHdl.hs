module Andromeda.Hardware.Hdl where

data ComponentClass
    = Sensors
    | Controllers

data ComponentDef = ComponentDef
    { componentClass :: ComponentClass
    , componentGuid :: String
    , componentManufacturer :: String
    , componentName :: String }
    

data Parameter = Temperature
               | Pressure

type ComponentIndex = String
data Component 
    = Sensor ComponentDef ComponentIndex Parameter
    | Controller ComponentDef

type Hdl = [Component]

sensor = Sensor
controller = Controller

temperature = Temperature
pressure = Pressure


type Hardware = () -- A dummy type. Design it later!
interpret :: Hdl -> IO Hardware
interpret [] = putStrLn "Finished."
interpret (c:cs) = case c of
    Sensor _ _ _ -> putStrLn "Interpret: Sensor"
    Controller _ -> putStrLn "Interpret: Controller"

guid1 = "3539390d-f189-4434-bd9e-d39e494a869a"
guid2 = "c80a1ba3-1e7a-4af9-a10b-2313cc10f9e4"
guid3 = "02ecabc3-1a02-481f-8e9a-7b0cc62e38f5"

aaa_p_02 = ComponentDef Sensors     guid1 "AAA Inc." "AAA-P-02"
aaa_t_25 = ComponentDef Sensors     guid2 "AAA Inc." "AAA-T-25"
aaa_c_86 = ComponentDef Controllers guid3 "AAA Inc." "AAA-C-86"

boostersDef :: Hdl
boostersDef =
   [ sensor aaa_t_25 "nozzle1-t" temperature
   , sensor aaa_p_02 "nozzle1-p" pressure
   , sensor aaa_t_25 "nozzle2-t" temperature
   , sensor aaa_p_02 "nozzle2-P" pressure
   , controller aaa_c_86 ]

