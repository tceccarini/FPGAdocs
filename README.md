# FPGAdocs

LaTeX sources of the master's thesis **"Video Acquisition and Processing on Intel Cyclone V SoC"**.

*Hardware Implementation with Embedded Linux and Bare-Metal Software Architectures*

- **Author:** Tiziano Ceccarini
- **Advisor:** Prof. Stefano Marsi
- **Institution:** Dipartimento di Ingegneria e Architettura, Università degli Studi di Trieste — Corso di laurea magistrale in Ingegneria Elettronica e Informatica [curr. Informatica]
- **Academic year:** 2025–2026

The thesis documents two sibling projects built around the same custom FPGA video-acquisition hardware on a Terasic DE1-SoC. This repository contains only the thesis document itself, not the project sources.

## Repository layout

- [`thesis_full/`](thesis_full/) — print-ready volume combining both summaries and the complete thesis without duplicating their sources.
- [`thesis/`](thesis/) — standalone thesis.
- [`summary_it/`](summary_it/) — standalone Italian summary.
- [`summary_en/`](summary_en/) — standalone English summary.

The combined volume contains the outer thesis cover, the Italian and English
summaries with continuous Roman page numbering, a repeated thesis cover, and
the complete thesis starting with the table of contents on Arabic page 1.
The summaries and their sections are included in the table of contents.

The document is laid out for duplex printing: covers, summaries, the table of
contents, parts, and chapters open on right-hand pages. Blank verso pages are
inserted when necessary and carry no page number or running header.

## Related repositories

- [FPGAlix](https://github.com/tceccarini/FPGAlix) — embedded-Linux camera pipeline for the Terasic DE1-SoC
- [FPGAsteel](https://github.com/tceccarini/FPGAsteel) — bare-metal camera-to-VGA pipeline for the Terasic DE1-SoC

## Downloads / Mirror

This shared folder mirrors everything needed to follow the tutorial without hunting down each piece separately:

[**Shared folder (Google Drive)**](https://drive.google.com/drive/folders/1E9_TK0q58tYiPStDuGA1JgQQHmZVmjKi?usp=sharing)

- the compiled thesis PDF
- the camera adapter board documentation (schematics, bill of materials, PCB layouts)
- third-party reference documentation (datasheets and manuals cited throughout the thesis)
- installers for the software used throughout the tutorial (Quartus Prime, toolchains, OpenOCD, Eclipse, Ubuntu image, ...)
- ready-to-use SD card images

## Building

Requires TeX Live, `latexmk`, `biber`, `makeglossaries`, and Inkscape. The
provided `latexmk` configurations enable shell escape so the `svg` package can
convert figures with Inkscape.

### Complete print-ready volume

```sh
cd thesis_full
latexmk -pdf -interaction=nonstopmode -halt-on-error thesis_full.tex
```

The resulting PDF is `thesis_full/build/thesis_full.pdf`. All generated files,
including converted SVGs and Inkscape's local profile and cache, remain under
`thesis_full/build/`.

For bound duplex output, print from the first PDF page, use two-sided printing
with long-edge binding, and do not let the print service insert a cover or a
blank page before the document.

### Standalone thesis

```sh
cd thesis
latexmk -pdf -interaction=nonstopmode -halt-on-error thesis.tex
```

The compiled PDF is produced at `thesis/build/thesis.pdf`.

### Standalone summaries

```sh
cd summary_it
latexmk -pdf -interaction=nonstopmode -halt-on-error summary_it.tex

cd ../summary_en
latexmk -pdf -interaction=nonstopmode -halt-on-error summary_en.tex
```

These commands produce `summary_it/build/summary_it.pdf` and
`summary_en/build/summary_en.pdf`, respectively.

## License

Released under [CC BY 4.0](LICENCE).  
