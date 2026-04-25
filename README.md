# On-Chain Journal (Base)

A smart contract that allows users to store daily logs on-chain while tracking streaks and XP.

## Why I Built This
Most on-chain activity is repetitive and meaningless. I wanted to create something that reflects real usage — a daily on-chain journal that proves consistency and activity over time.

## Features
- Write daily logs on-chain
- Automatic streak tracking
- XP system for each interaction
- Fully transparent on Base network

## Contract Address
0x795d938c232fe0dae37f68ff9de45f3fdabbb88e

## Example Usage
logEntry("deployed my first contract on Base and started journaling")

## Functions
- logEntry(string text)
- getEntries(address user)
- getStreak(address user)
- getXP(address user)

## Tech
- Solidity ^0.8.20
- Base Network
- Remix IDE

## Future Improvements
- Frontend interface
- NFT rewards for streak milestones
- Farcaster integration

## Status
Active and improving 
