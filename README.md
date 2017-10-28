# ShodAND Scanner

Contains all the elements to quickly deploy a ShodAND Scanner.

It deploys [pbscan](https://github.com/gvb84/pbscan) over [Docker](https://github.com/docker).

## 1) Install it

Clone this repo:
```
$ git clone https://github.com/ShodAND/scanner.git
```

### Using Docker Compose

Just call docker compose in run mode, and a shell will be returned:
```
$ docker-compose run scanner
```

### Manually using Docker

First, create the image:
```
$ bash build.sh
```
, this will create the image `shodand/scanner` 


Finally prepare the instance of the scanner with:
```
$ bash create.sh
```
, this will create the container `scanner` 


## 2) Use it

To start the container just start it:
```
$ docker start scanner
```
, this will ensure that the container is ready.

Later, attach a shell to interact with the scanner:
```
$ docker exec -it scanner bash
```

Once the scanner container is attached, play with the scanner:
```
(scanner) $ pbscan --help
```

## 3) Examples

### Banner grab

Banner grab mostly used ports from $IP:

```
(scanner) $ pbscan -sB 80,443,22,53,8000-9000,9443,3000,5000 $IP
```


### HTTP

Send an initial HTTP request to $IP using `-sH` instead of `-sB` :

```
(scanner) $ pbscan -sH 80,443,22,53,8000-9000,9443,3000,5000 $IP
```


### TLS

Send an initial TLS request to $IP using `-sT` instead of `-sB` :

```
(scanner) $ pbscan -sT 80,443,22,53,8000-9000,9443,3000,5000 $IP
```

