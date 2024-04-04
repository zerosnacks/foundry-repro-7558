# Foundry repro

## Usage

```
cp .env.template .env
```

Fill out `.env` and run:

```
source .env
forge test -vvv --rpc-url $ETH_RPC_URL --etherscan-api-key $ETHERSCAN_API_KEY
```

## Output

```
Ran 3 tests for test/Forking.t.sol:ForkingTest
[PASS] testForkGetPriceA() (gas: 27345)
Logs:
  Price A: 335172810074

Traces:
  [27345] ForkingTest::testForkGetPriceA()
    ├─ [15735] EACAggregatorProxy::latestRoundData() [staticcall]
    │   ├─ [7502] AccessControlledOffchainAggregator::latestRoundData() [staticcall]
    │   │   └─ ← [Return] 14720 [1.472e4], 335172810074 [3.351e11], 1712226143 [1.712e9], 1712226143 [1.712e9], 14720 [1.472e4]
    │   └─ ← [Return] 110680464442257324416 [1.106e20], 335172810074 [3.351e11], 1712226143 [1.712e9], 1712226143 [1.712e9], 110680464442257324416 [1.106e20]
    ├─ [0] console::log("Price A: %d", 335172810074 [3.351e11]) [staticcall]
    │   └─ ← [Stop] 
    └─ ← [Stop] 

[PASS] testForkGetPriceB() (gas: 27367)
Logs:
  Price B: 335172810074

Traces:
  [27367] ForkingTest::testForkGetPriceB()
    ├─ [15735] 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419::latestRoundData() [staticcall]
    │   ├─ [7502] 0xE62B71cf983019BFf55bC83B48601ce8419650CC::latestRoundData() [staticcall]
    │   │   └─ ← [Return] 14720 [1.472e4], 335172810074 [3.351e11], 1712226143 [1.712e9], 1712226143 [1.712e9], 14720 [1.472e4]
    │   └─ ← [Return] 110680464442257324416 [1.106e20], 335172810074 [3.351e11], 1712226143 [1.712e9], 1712226143 [1.712e9], 110680464442257324416 [1.106e20]
    ├─ [0] console::log("Price B: %d", 335172810074 [3.351e11]) [staticcall]
    │   └─ ← [Stop] 
    └─ ← [Stop] 

[PASS] testForkGetPriceC() (gas: 27369)
Logs:
  Price C: 335172810074

Traces:
  [27369] ForkingTest::testForkGetPriceC()
    ├─ [15735] 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419::latestRoundData() [staticcall]
    │   ├─ [7502] 0xE62B71cf983019BFf55bC83B48601ce8419650CC::latestRoundData() [staticcall]
    │   │   └─ ← [Return] 14720 [1.472e4], 335172810074 [3.351e11], 1712226143 [1.712e9], 1712226143 [1.712e9], 14720 [1.472e4]
    │   └─ ← [Return] 110680464442257324416 [1.106e20], 335172810074 [3.351e11], 1712226143 [1.712e9], 1712226143 [1.712e9], 110680464442257324416 [1.106e20]
    ├─ [0] console::log("Price C: %d", 335172810074 [3.351e11]) [staticcall]
    │   └─ ← [Stop] 
    └─ ← [Stop] 

Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 2.19s (3.97s CPU time)

Ran 1 test suite in 4.49s (2.19s CPU time): 3 tests passed, 0 failed, 0 skipped (3 total tests)
```

Notice it resolves `0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419` to `EACAggregatorProxy` for the first trace A but not for the second B or third C, same with `0xE62B71cf983019BFf55bC83B48601ce8419650CC` to `AccessControlledOffchainAggregator`.