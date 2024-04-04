// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";

// Source: https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol
interface AggregatorV3Interface {
    function decimals() external view returns (uint8);

    function description() external view returns (string memory);

    function version() external view returns (uint256);

    function getRoundData(
        uint80 _roundId
    )
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );

    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        );
}

contract ForkingTest is Test {
    AggregatorV3Interface internal priceFeed;

    function testForkGetPriceA() public {
        int256 price = _getPrice();
        console2.log("Price A: %d", price);
    }

    function testForkGetPriceB() public {
        int256 price = _getPrice();
        console2.log("Price B: %d", price);
    }

    function testForkGetPriceC() public {
        int256 price = _getPrice();
        console2.log("Price C: %d", price);
    }

    function _getPrice() internal returns (int256 price) {
        priceFeed = AggregatorV3Interface(
            0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        );
        (, price, , , ) = priceFeed.latestRoundData();
    }
}
