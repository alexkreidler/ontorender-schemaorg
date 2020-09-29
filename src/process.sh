#!/usr/bin/env bash

# Script Dir
SD=$(dirname $0)

# Work Dir
WD=$SD/work
mkdir -p $WD

# schema file
sfile=$WD/schema.ttl
if [[ ! -f "$sfile" ]]; then
    $SD/dl.sh $sfile
fi

queried=$WD/queried.ttl
norm=$WD/norm.ttl

comunica-sparql-file $sfile -t text/turtle -f $SD/query.rq > $queried

cat $queried | graphy read -c ttl / canonical / write -c ttl > $norm

rdf-converter convert $norm $WD/out/out.trig
rdf-converter convert $norm $WD/out/out.nq
rdf-converter convert $norm $WD/out/out.ttl
rdf-converter convert $norm $WD/out/out.nt
rdf-converter convert $norm $WD/out/out.n3
rdf-converter convert $norm $WD/out/out.jsonld