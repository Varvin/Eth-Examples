var InvestorProcessor = artifacts.require("./InvestorProcessor.sol");

module.exports = function(deployer, network, accounts) {
	console.log(accounts);
  	deployer.deploy(InvestorProcessor, {from: accounts[0]});
};
