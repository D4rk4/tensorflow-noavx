# TensorFlow without AVX

This repository provides a build environment tailored for compiling TensorFlow without the use of AVX (Advanced Vector Extensions) instructions. This adaptation is especially beneficial for operating TensorFlow on older CPU models lacking AVX support, as well as on certain newer low-end Intel processors, such as the J4005.


## Installation

```git clone https://github.com/D4rk4/tensorflow-noavx.git && cd tensorflow-noavx && chmod +x noavx && ./noavx.sh```

## Usage

After executing noavx.sh building process should start.

Note: Required docker for building.

## Features

- TensorFlow functionality without the need for AVX support.

