pragma solidity ^0.8.0;

interface IDetectionBot {
    function handleTransaction(address user, bytes calldata msgData) external;
}

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;

    function notify(address user, bytes calldata msgData) external;

    function raiseAlert(address user) external;
}

contract FortaRobot is IDetectionBot {
    address private _cryptoVault;
    IForta private _forta;

    constructor(address cryptoVault, IForta forta) {
        _cryptoVault = cryptoVault;
        _forta = forta;
    }

    function handleTransaction(address user, bytes calldata msgData) external {
        address originalSender;
        (, , originalSender) = abi.decode(
            msgData[4:],
            (address, uint256, address)
        );
        if (originalSender == _cryptoVault) {
            _forta.raiseAlert(user);
        }
    }
}
