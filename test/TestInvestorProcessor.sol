pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/InvestorProcessor.sol";

contract TestInvestorProcessor{

	event InvestorsLog(address from, address[] investors);

    function testAddIncestor() public {
		uint expectedCount = 1;
		address expecteAddress = '0x627306090abab3a6e1400e9345bc60c78a8bef57';

        InvestorProcessor processor = InvestorProcessor(DeployedAddresses.InvestorProcessor());
        processor.add(expecteAddress);
        address[] investors = processor.getAll();
        InvestorsLog(msg.sender, investors);

        Assert.equal(investors.lenth, expectedCount, "Returned wrong number of account");
        Assert.equal(investors[0],expecteAddress, "Returned wrong address");
    }
}