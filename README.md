# BBQCoin

The good old BBQCoin ran on Ubuntu 16.04. We know it's old, but wanted to keep the original code and blockchain, going back to 2012.

Premine? Nah man, we included the original 2012 chain. We minted a few blocks at our pool to test and see if it worked.
This one is for the community! The X account "bbqcoin_2012" is acting like they're the 2012 og team haha.

Need [a bootstrap.dat file? click this link](https://mega.nz/file/6I0Cma4K#EdcdtnZhlK8IsUJ0TmjZqx-aF43uhoe68DhFRa4vQ5g)

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

or if bootstrapping
```bash
./bbqcoind -loadblock=/root/.bbqcoin/bootstrap.dat
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