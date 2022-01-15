# pman0214/textlint-ja-technical-writing-tex

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> textlint execution environment on docker

## Table of Contents

- [pman0214/textlint-ja-technical-writing-tex](#pman0214textlint-ja-technical-writing-tex)
  - [Table of Contents](#table-of-contents)
  - [Install](#install)
  - [Usage](#usage)
  - [Building](#building)
  - [Contribute](#contribute)
  - [License](#license)

## Install

```bash
docker pull pman0214/textlint-ja-technical-writing-tex
```

## Usage

Default `WORKDIR` is `/app`.

Before executing texlint, prepare for your own custom `.textlintrc`.
An example of the `.textlintrc` file is included in this repository in the `files/` directory, which is not installed in this docker image.
You can download and modify the example.
```bash
curl -O -L https://github.com/pman0214/docker_textlint-ja-technical-writing-tex/raw/master/files/.textlintrc
```

```bash
docker run --rm -it -v $PWD:/app pman0214/textlint-ja-technical-writing-tex textlint *.tex > textlint_results.txt
```

## Building

If you want to build this image by yourself, please prepare for a multi-architecture builder referring to the [official documents](https://docs.docker.com/desktop/multi-arch/).
```bash
docker run --privileged --rm tonistiigi/binfmt --uninstall "qemu-*"
docker run --privileged --rm tonistiigi/binfmt --install all
docker buildx create --name multiarch --driver docker-container
docker buildx use multiarch
docker buildx inspect --bootstrap
```
In this example, `multiarch` is the name of the multi-architecture builder.

You can build this image with your own multi-architecture builder.
```bash
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t "textlint-ja-technical-writing-tex" \
  . --load
```
`--push` option instead of `--load` with appropriate tag pushes built images to GitHub.

## Contribute

* Bugfix pull requests are welcome.

## License

All the source files are released under the MIT license. See `LICENSE.txt`.

* Copyright (c) 2021 Shigemi ISHIDA
