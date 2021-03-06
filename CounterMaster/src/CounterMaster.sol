pragma solidity ^0.4.20;

// 계정 관리용 Contract
contract CounterMaster {
    // 계정 목록
    // Contract는 주소를 지정해 호출해야하기 때문에 주소 및 카운터 Contract를 지원하는 맵 정보
    mapping (address => Counter) private counters;
    // 주소를 관리하는 배열
    address[] private addressList;

    // 카운터 Contract를 배열과 맵에 추가
    function addCounter(bytes32 name) {
        // 카운터 Contract를 작성
        Counter c = new Counter(name);

        // 배열에 주소를 추가
        addressList.push(address(c));
        // 매핑에 주소와 카운터 Contract 등록
        counters[address(c)] = c;
    }

    // 카운터 Contract 주소 목록 가져 오기
    function getCounterAddressList() constant returns
    (address[] counterAddressList) {
        counterAddressList = addressList;
    }
}

// 카운터 Contract
contract Counter {
    // 카운터 항목 이름
    bytes32 counterName;
    // 카운트 수
    uint32 numberOfCounter;

    // 생성자(신규 작성시에 카운터 항목 이름 설정)
    function Counter(bytes32 name) {
        counterName = name;
    }

    // 카운트 업
    function countUp() {
        numberOfCounter++;
    }

    // 카운터 항목 이름 검색
    function getCounterName() constant returns (bytes32 name) {
        return counterName;
    }

    //카운트 수 가져오기
    function getNumberOfCounter() constant returns (uint32 number) {
        return numberOfCounter;
    }
}

/*
geth --networkid "123" --rpc --rpcaddr "172.16.234.28" --rpcport 8545 --rpccorsdomain "*" --rpcapi "net,eth,web3,personal" --datadir "eth_data" --testnet console

geth --networkid "123" --rpc --rpcaddr "172.16.234.28" --rpcport 8545 --rpccorsdomain "*" --rpcapi "net,eth,web3,personal" --datadir "eth_testdata" --testnet console


Account
0x938b987ebb7652556f3e014549e48a29183abea9

CounterMaster at
0x3bf7250ceaa00d27646307f3125ef6d3e33f51ef
*/
