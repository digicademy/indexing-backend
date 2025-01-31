# Indexing Backend

## Scope

This a is Docker container for generating the indexes for a digital resource, according to an indexing ontology. In order to provide fast generation of the indexes out of a digital resource, the goals of this container are: ```small size```, and ```speed```.

## Architecture



## Components

The container provides the following modules:

* [xsltproc](http://xmlsoft.org/xslt/xsltproc.html), needed for XSLT transformations.

* [rdf-data-aggregator](https://gitlab.rlp.net/adwmainz/nfdi4culture/cdmd/rdf-data-aggregator) based upon [oxigraph](https://github.com/oxigraph/oxigraph) that runs in memory, needed for SPARQL queries used to generate indexes out of RDF data;

* [ttl-merger](https://gitlab.com/claudius-teodorescu/ttl-merger) needed for merging various RDF files in Tyrtle format;

* [xml-to-index-as-triples](https://gitlab.com/claudius-teodorescu/xml-to-index-as-triples) needed for extracting indexes out of XML data.

* [index-as-triples-to-compressed-index](https://gitlab.com/claudius-teodorescu/index-as-triples-to-compressed-index) needed to compress the indexes.

* [index-as-triples-to-metadata](https://gitlab.com/claudius-teodorescu/index-as-triples-to-metadata) needed for extracting metadata from indexes.

* [rdfa-template-engine](https://gitlab.com/claudius-teodorescu/rdfa-template-engine) needed to generate the static website for a digital edition.

## Ideas

* Include all the processing steps in a single Rust executable, called ```indexing-backend```.

