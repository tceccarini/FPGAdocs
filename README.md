# FPGAdocs

LaTeX sources of the master's thesis **"Acquisizione ed elaborazione video su SoC FPGA"** ("Video acquisition and processing on a SoC FPGA").

*Realizzazione hardware su Intel Cyclone V SoC e software in due versioni, Linux embedded e bare-metal*
*(Hardware implementation on an Intel Cyclone V SoC, with software in two versions: embedded Linux and bare-metal)*

- **Author:** Tiziano Ceccarini
- **Advisor:** Prof. Stefano Marsi
- **Institution:** Dipartimento di Ingegneria e Architettura, Università degli Studi di Trieste — Corso di laurea magistrale in Ingegneria Elettronica e Informatica [curr. Informatica]
- **Academic year:** 2025–2026

The thesis documents two sibling projects built around the same custom FPGA video-acquisition hardware on a Terasic DE1-SoC. This repository contains only the thesis document itself, not the project sources.

## Related repositories

- [FPGAlix](https://github.com/tceccarini/FPGAlix) — embedded-Linux camera pipeline for the Terasic DE1-SoC
- [FPGAsteel](https://github.com/tceccarini/FPGAsteel) — bare-metal camera-to-VGA pipeline for the Terasic DE1-SoC

## Downloads

This shared folder mirrors everything needed to follow the tutorial without hunting down each piece separately:

[**Shared folder (Google Drive)**](https://drive.google.com/drive/folders/1E9_TK0q58tYiPStDuGA1JgQQHmZVmjKi?usp=sharing)

- the compiled thesis PDF
- the camera adapter board documentation (schematics, bill of materials, PCB layouts)
- third-party reference documentation (datasheets and manuals cited throughout the thesis)
- installers for the software used throughout the tutorial (Quartus Prime, toolchains, OpenOCD, Eclipse, Ubuntu image, ...)
- ready-to-use SD card images

## Building

Requires a TeX Live installation with `latexmk` and `-shell-escape` support (used by the `svg` package to convert figures via Inkscape).

```
latexmk -pdf -interaction=nonstopmode thesis.tex
```

The compiled PDF is produced at `build/thesis.pdf`.

## License

Released under [CC BY 4.0](LICENCE).  
