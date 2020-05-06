# ruby-alpine-passenger

## Details

The image based on [ruby:alpine](https://hub.docker.com/_/ruby)
running the [Phusion Passenger Standalone](https://www.phusionpassenger.com/library/config/standalone/).

### Phusion Passenger Standalone

The standalone runtime runs on Nginx. Those interested should take a look at the 
[docs](https://www.phusionpassenger.com/library/config/standalone/) provided by the Phusion team, especially [command line options](https://www.phusionpassenger.com/library/config/standalone/reference/)
and [Nginx configuration](https://www.phusionpassenger.com/library/config/standalone/intro.html#nginx-configuration-template)

#### Default command line arguments

By default, the image runs with `passenger start --no-install-runtime --no-compile-runtime`
plus the additional arguments supplied to `docker run`.

Passenger runs on port 3000 by default and this port has been exposed.

### Edge packages

Passenger requires packages only available in the testing repository of Alpine Linux edge:
[libexecinfo](http://pkgs.alpinelinux.org/package/testing/x86_64/libexecinfo) and [libexecinfo-dev](http://pkgs.alpinelinux.org/package/testing/x86_64/libexecinfo-dev).

### Building extension modules

You can use this image to build the Nginx or Apache modules for Phusion Passenger.
Take care that you will need to compile from source! Pre-compiled binaries that the Phusion team
provide (probably) won't work since Alpine Linux uses `musl` instead of `glibc`.

Have a look at the `alpine-passenger` Dockerfile to see how the standalone runtime was compiled.
