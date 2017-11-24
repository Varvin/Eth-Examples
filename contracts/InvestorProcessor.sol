pragma solidity ^0.4.17;

contract InvestorProcessor {
	
	address private owner;
	address[] private investors;
	mapping(address => uint256) private investorIndex;

	modifier restricted() {
		if (msg.sender == owner) _;
	}

	function InvestorProcessor() public {
		owner = msg.sender;
	}

	function add(address investor) public restricted {
		if(investorIndex[investor] == 0){
			investors.push(investor);
			investorIndex[investor] = investors.length - 1;
		}
	}

	function remove(address investor) public restricted {
		uint256 index = investorIndex[investor];
		delete investors[index];
		investorIndex[investor] = 0;
	}

	function getAll() public view returns (address[]) {
		return investors;
	}

	function getAt(uint256 index) public view returns (address) {
		return investors[index];
	}

	function replace(address oldAddress, address newAddress) public restricted {
		uint256 index = investorIndex[oldAddress];
		investors[index] = newAddress;
		investorIndex[oldAddress] = 0;
		investorIndex[newAddress] = index;
	}

	function contains(address investor) public view returns (bool) {
		return investorIndex[investor] != 0;
	}
}