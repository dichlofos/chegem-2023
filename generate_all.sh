#!/usr/bin/env bash
set -xe
python3 preprocess.py pandoc

trip_name="chegem_2023"

pandoc report_${trip_name}_pdf.md metadata.yaml \
    -V mainfont="Liberation Serif" \
    -V papersize="a4" \
    -V geometry="top=1cm" \
    -V geometry="left=1cm" \
    -V geometry="right=1cm" \
    -V geometry="bottom=2cm" \
    --pdf-engine=xelatex \
    -o report_${trip_name}_pdf.pdf

if false; then
    pandoc report_${trip_name}_ch.md metadata.yaml \
        -V mainfont="Liberation Serif" \
        -V papersize="a4" \
        -V geometry="top=1cm" \
        -V geometry="left=1cm" \
        -V geometry="right=1cm" \
        -V geometry="bottom=2cm" \
        --pdf-engine=xelatex \
        -o report_${trip_name}_ch.pdf
fi

if grep TODO report_${trip_name}.md ; then
    echo "WARNING: Some TODOs not resolved yet"
fi
