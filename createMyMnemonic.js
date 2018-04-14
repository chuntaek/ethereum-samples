/* Mnemonic generation */

var Mnemonic = require('bitcore-mnemonic');
var code = new Mnemonic();
//var code = new Mnemonic(Mnemonic.Words.SPANISH);
console.log(code.toString()); // natal hada sutil año sólido papel jamón combate aula flota ver esfera...
var xpriv = code.toHDPrivateKey();

