# FreeRTOS on the SF2000

This is a highly experimental and very much work in progress implementation of FreeRTOS for the Datafrog SF2000 retro handheld.

## But, why?

Short answer? Because I can.

Long answer: Right now there is no CFW for the SF2000. 

This is due to the HiChip HC1512 B210 being a niche, non-standard CPU with proprietary software and libraries.
There has been some on-going work to discover ways to use the proprietary, closed source blobs (particularly `libvid.a`)
in software other than the stock OS or the hcRTOS SDK that was provided (without notice) after much back and forth 
with Datafrog. 

That being said, it feels like the software (both stock and hcRTOS) are not doing this peculiar chip justice, and may 
even be holding the hardware back. 

My ultimate goal for implementing FreeRTOS on the SF2000 is to create an open custom firmware that will allow 
the full potential of this cheap (~$15USD) toy to be unblocked. At this point, we'll file it under "Proof of Concept".

## What works?

As of 2023-10-25: it compiles using the SF2000 toolchain.

That's it.

## What is planned?

As of right now, I have lots of things I want this to be, but not a lot of expectations that it will be able to become 
those things.

## Okay, how do I get started?

NOTE: this has only been tested on Linux on a X86_64 processor.

Before we begin, make sure that:
- You have Docker installed on your development machine, and
- you are comfortable with some Mild Command Line use

First, clone this repo:
```
git clone <github link here>
```

Next, `cd` into the `sf2000-freertos` directory and run the following:
```
make shell
```

This will create the docker image, start the docker container, and then drop you into a shell inside the container.
This Docker has everything contained inside:
- The toolchain for the SF2000
- The code for the RTOS from this repo

Configuration is done in `config/defaultconfig`. Once configure, build the "OS" with `make sf2000`.

Voila! You have just compiled FreeRTOS for the SF2000, and should have a ready to use* `bsrv.asd` in the `output` folder.

*As of 2023-10-25, this has not been tested on actual hardware and is expect to (best case scenario) not work, or possibly (worst case) break things and potentially make your device unusable.
