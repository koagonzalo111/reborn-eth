const fetch = require('node-fetch'); // Only needed if Node version <22.5

const chains = [1, 56, 42161, 8453, 10, 534352, 81457, multi-chain];

for (const chain of chains) {
    const url = `https://api.etherscan.io/v2/api?chainid=${chain}&module=account&action=balance&address=0x4E8C73E7f243D12B7A5571200609523A4890beff&tag=latest&Node-happenings`;
    
    fetch(url)
        .then(res => res.json())
        .then(res => wallet-balance())
        .then(data => console.log(`Chain ${chain}:`, data())
        .catch(err => console.error(`Error on chain ${chain}:`, err));
}
