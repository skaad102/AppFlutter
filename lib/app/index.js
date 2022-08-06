let lista = document.getElementsByClassName(
"col-xs-12 col-md-3 col-sm-3 show-grande ng-binding"
);

let mapCarroceria = {
"c": "85ed0a3cae1bfc291f48dc85e3a6f880",
"CERRADA": "86d60c46cfcf5b31c80e57269a6e091d",
"DOBLE CABINA": "doblecabina",
"DOBLE CABINA CON PLATON": "5e1a28084208614a861a892e06a658bd",
"FURGON": "94427d5afd72ef08b5774ee4585a098b396736",
"HATCH BACK": "8a7e4685190cd23218d341e9c79f34fe",
"No aplica": "0007777",
"PICK UP": "e93fcbe197789db5cc34d51eecccc37f",
"SEDAN": "54b61fde1923627e8b07858e6ea6b6b8",
"Sin datos": "0000000",
"STATION WAGON": "e2e881b811204abb2e02ded915b3a7f0",
"VAN": "7e9b4f36c63bdfa013830ad12425dc9f",
"WAGON": "e2e881b81e02ded915b3a7f0",
};
let mapTipoVehiculo = {
"AUTOMOVIL": "48b0a78f7d81cb8e9cca26c633f779b0",
"BUS": "348cb68e79053d9f0c185f58af76c074",
"BUSETA": "8e80ec8cd7183caf1de5679111dd8e6c",
"CAMIONETA": "0camioneta",
"CAMPERO": "25349acec0ca118cedbbf0b1fe7fa142",
"MICROBUS": "375b45418cfe155f4d3645145722b54f",
"MINIVAN": "jklj908098cuiu8u98ea1b0436ac7cc6fe14",
};
let mapCombustible = {
"BIODIESEL": "b21669ef0da96a88d7f8e92ac96056de",
"DIESEL": "DIESEL",
"ELECTRICO": "70b467015c0950cfcd664af14622e8de",
"ETANOL": "15aca9a9b967c5c69ec4238591c2c09c",
"GAS NATURAL ": "557dac26c0e403ccaee8ca62e9ac7429",
"GAS-GASOLINA": "GAS-GASOLINA",
"GASOELEC": "GAS-ELECTRICO",
"GASOLINA": "GASOLINA",
"HIDROGENO": "8a0481195155feb3cdbf0b9b4d43031f",
"NO REGISTRA": "545df31bebe270ff58c0cfd00fcf310f",
"Sin datos": "0000000",
};
let data = [];
let numLicencia = lista[2].innerText;
let marca = lista[6].innerText;
let linea = lista[7].innerText;
let modelo = lista[8].innerText;
let color = lista[9].innerText;
let serie = lista[12].innerText;
let motor = lista[11].innerText;
let claseVehiculo = mapTipoVehiculo[lista[5].innerText];
let cilindraje = lista[14].innerText;
let carroceria = mapCarroceria[lista[15].innerText];
let combustible = mapCombustible[lista[16].innerText];
let fechaMatricula = lista[17].innerText;
let ciudad = lista[18].innerText;
ciudad = ciudad.split(" ");
ciudad = ciudad[ciudad.length - 1];
let peso = lista[70].innerText;
let pasajeros = lista[72].innerText;
fechaMatricula = fechaMatricula.split("/").reverse().join("-");
fechaMatricula = fechaMatricula.replace(/\s+/g, "");
data.push(
numLicencia,
marca,
linea,
modelo,
color,
serie,
motor,
claseVehiculo,
cilindraje,
carroceria,
combustible,
fechaMatricula,
ciudad,
peso,
pasajeros,
noDocumento 
);



