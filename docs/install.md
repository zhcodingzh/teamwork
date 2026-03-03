# Installation

Latest Version: **GITHUB_VERSION**

Before starting Teamwork you may read [Configuration](config.md).

!> TLS is required for Teamwork to work. Either enable TLS inside Teamwork or 
   use a reverse proxy to serve Teamwork via TLS.

## Docker

Setting up Teamwork with docker is pretty easy, you basically just have to start the docker container, and you are ready to go:

[ghcr.io/zhcodingzh/teamwork](https://github.com/orgs/teamwork/packages/container/package/server) and
[zhcodingzh/teamwork](https://hub.docker.com/r/zhcodingzh/teamwork)
docker images are multi-arch docker images.
This means the image will work for `amd64`, `i386`, `ppc64le` (power pc), `arm64`, `armv7` (Raspberry PI) and `armv6`.

By default, Teamwork runs on port 5050.

?> Replace `EXTERNALIP` with your external IP. One way to find your external ip is with ipify.
   `curl 'https://api.ipify.org'`

```bash
$ docker run --net=host -e SCREEGO_EXTERNAL_IP=EXTERNALIP ghcr.io/zhcodingzh/teamwork:GITHUB_VERSION
```

**docker-compose.yml**
```yaml
services:
  teamwork:
    image: ghcr.io/zhcodingzh/teamwork:GITHUB_VERSION
    network_mode: host
    environment:
      SCREEGO_EXTERNAL_IP: "EXTERNALIP"
```

If you don't want to use the host network, then you can configure docker like this:

<details><summary>(Click to expand)</summary>
<p>

!> Teamwork may not work correctly when deploying it in docker without `network_mode: host`.
   See [#226](https://github.com/zhcodingzh/teamwork/issues/226)

```bash
$ docker run -it \
    -e SCREEGO_EXTERNAL_IP=EXTERNALIP \
    -e SCREEGO_TURN_PORT_RANGE=50000:50200 \
    -p 5050:5050 \
    -p 3478:3478 \
    -p 50000-50200:50000-50200/udp \
    zhcodingzh/teamwork:GITHUB_VERSION
```

#### docker-compose.yml

```yml
version: "3.7"
services:
  teamwork:
    image: ghcr.io/zhcodingzh/teamwork:GITHUB_VERSION
    ports:
      - 5050:5050
      - 3478:3478
      - 50000-50200:50000-50200/udp
    environment:
      SCREEGO_EXTERNAL_IP: "192.168.178.2"
      SCREEGO_TURN_PORT_RANGE: "50000:50200"
```

</p>
</details>

## Binary

### Supported Platforms:

- linux_amd64 (64bit)
- linux_i386 (32bit)
- armv7 (32bit used for Raspberry Pi)
- armv6
- arm64 (ARMv8)
- ppc64
- ppc64le
- windows_i386.exe (32bit)
- windows_amd64.exe (64bit)

Download the zip with the binary for your platform from [zhcodingzh/teamwork Releases](https://github.com/zhcodingzh/teamwork/releases).

```bash
$ wget https://github.com/zhcodingzh/teamwork/releases/download/vGITHUB_VERSION/teamwork_GITHUB_VERSION_{PLATFORM}.tar.gz
```

Unzip the archive.

```bash
$ tar xvf teamwork_GITHUB_VERSION_{PLATFORM}.tar.gz
```

Make the binary executable (linux only).

```bash
$ chmod +x teamwork
```

Execute teamwork:

```bash
$ ./teamwork
# on windows
$ teamwork.exe
```

## Arch-Linux(aur)

!> Maintenance of the AUR Packages is not performed by the Teamwork team.
   You should always check the PKGBUILD before installing an AUR package.

Teamwork's latest release is available in the AUR as [teamwork-server](https://aur.archlinux.org/packages/teamwork-server/) and [teamwork-server-bin](https://aur.archlinux.org/packages/teamwork-server-bin/).
The development-version can be installed with [teamwork-server-git](https://aur.archlinux.org/packages/teamwork-server-git/).

## FreeBSD

!> Maintenance of the FreeBSD Package is not performed by the Teamwork team.
   Check yourself, if you can trust it.

```bash
$ pkg install teamwork
```

## Source

[See Development#build](development.md#build)
