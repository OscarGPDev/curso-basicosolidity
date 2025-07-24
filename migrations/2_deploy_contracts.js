const MyContract = artifacts.require("MisModificadores");

     module.exports = function (deployer) {
       deployer.deploy(MyContract);
     };