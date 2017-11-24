var InvestorProcessor = artifacts.require("./InvestorProcessor.sol");

module.exports = function(deployer, network, accounts) {
	console.log(accounts[0]);
  	deployer.deploy(InvestorProcessor, {from: accounts[0]});
};
