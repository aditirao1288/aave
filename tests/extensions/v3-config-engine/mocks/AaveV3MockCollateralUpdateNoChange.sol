// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import '../../../../src/contracts/extensions/v3-config-engine/AaveV3Payload.sol';

/**
 * @dev Smart contract for a mock collateral update with no changes, for testing purposes
 * IMPORTANT Parameters are pseudo-random, DON'T USE THIS ANYHOW IN PRODUCTION
 * @author BGD Labs
 */
contract AaveV3MockCollateralUpdateNoChange is AaveV3Payload {
  address public immutable ASSET_ADDRESS;

  constructor(address assetAddress, address customEngine) AaveV3Payload(IEngine(customEngine)) {
    ASSET_ADDRESS = assetAddress;
  }

  function collateralsUpdates() public view override returns (IEngine.CollateralUpdate[] memory) {
    IEngine.CollateralUpdate[] memory collateralsUpdate = new IEngine.CollateralUpdate[](1);

    collateralsUpdate[0] = IEngine.CollateralUpdate({
      asset: ASSET_ADDRESS,
      ltv: EngineFlags.KEEP_CURRENT,
      liqThreshold: EngineFlags.KEEP_CURRENT,
      liqBonus: EngineFlags.KEEP_CURRENT,
      debtCeiling: EngineFlags.KEEP_CURRENT,
      liqProtocolFee: EngineFlags.KEEP_CURRENT
    });

    return collateralsUpdate;
  }

  function getPoolContext() public pure override returns (IEngine.PoolContext memory) {
    return IEngine.PoolContext({networkName: 'Local', networkAbbreviation: 'Loc'});
  }
}
