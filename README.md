# BBQCoin

The good old BBQCoin ran on Ubuntu 16.04. We know it's old, but wanted to keep the original code and blockchain, going back to 2012.

Use the Dockerfile to run a node.

## Build
```bash
docker build -t bbqcoin .
```

## Run
Make sure to make a "data" folder locally, where you can edit the bbqcoin.conf file.
There's a `bbqcoin-example.conf` file included, you can copy or rename this file to `bbqcoin.conf`. make sure to edit the `rpcuser` and `rpcpassword`

We map the volume when running the container like this:

```bash
docker run -v ./data:/root/.bbqcoin -p 19322:19322 -p 19323:19323 -it bbqcoin bash
```

```bash
cd BBQCoin/src
./bbqcoind -printtoconsole
```

## Create wallet
```
open new tab
docker ps => copy container_name (for example "boring_duck")
docker exec -it boring_duck bash
cd BBQCoin/src
./bbqcoin-cli getnewaddress ""
```
The wallet.dat file will be created in your local data folder.
You can also use "dumpprivkey" to make sure you have a proper wallet backup.

## Pool
[https://bbqcoinpool.com](https://bbqcoinpool.com)