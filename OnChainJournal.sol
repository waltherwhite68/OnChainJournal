// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OnChainJournal {

    struct Entry {
        string text;
        uint256 timestamp;
    }

    mapping(address => Entry[]) public entries;
    mapping(address => uint256) public lastEntryTime;
    mapping(address => uint256) public streak;
    mapping(address => uint256) public xp;

    event NewEntry(address indexed user, string text, uint256 timestamp, uint256 streak, uint256 xp);

    function logEntry(string memory _text) public {
        require(bytes(_text).length > 0, "Empty text");

        // entry ekle
        entries[msg.sender].push(Entry(_text, block.timestamp));

        // streak hesapla
        if (block.timestamp > lastEntryTime[msg.sender] + 1 days) {
            // yeni gün
            if (block.timestamp <= lastEntryTime[msg.sender] + 2 days) {
                streak[msg.sender] += 1;
            } else {
                streak[msg.sender] = 1;
            }
        }

        lastEntryTime[msg.sender] = block.timestamp;

        // xp ver
        xp[msg.sender] += 10;

        emit NewEntry(msg.sender, _text, block.timestamp, streak[msg.sender], xp[msg.sender]);
    }

    function getEntries(address user) public view returns (Entry[] memory) {
        return entries[user];
    }

    function getStreak(address user) public view returns (uint256) {
        return streak[user];
    }

    function getXP(address user) public view returns (uint256) {
        return xp[user];
    }
}
