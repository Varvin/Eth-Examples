const InvestorProcessor = artifacts.require("./InvestorProcessor.sol");
// const Web3 = require('web3')
// const web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:9545"))

contract('TestInvestorProcessor', function(accounts) {
	it("Should create investor and return one", async function () {
		let processor = await InvestorProcessor.deployed();
		console.log("122345")
		await processor.add(accounts[1],{from:accounts[0]});
		console.log("qww")
		let addresses = await processor.getAll.call({from:accounts[0]});
		console.log('!!!!!!!!!!!!!!', addresses);
		assert.equal(addresses[1],accounts[1],"Returned vrong account id");
	});
});