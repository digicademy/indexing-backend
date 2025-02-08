# Indexing Backend

## Scope

This a is Docker container for generating the indexes for a digital resource, according to [an indexing ontology](https://claudius-teodorescu.gitlab.io/indexing-ontology/index-en.html). In order to provide fast generation of the indexes out of a digital resource, the goals of this container are: ```small size```, and ```speed```.

## Architecture

### For the ```small size``` goal

To have a small size of this container, the base image was choosen to be [busybox:latest](https://hub.docker.com/_/busybox), which is about 2MB in size. The [scratch](https://hub.docker.com/_/scratch) image, which is much smaller, was not used, due to the fact that the continuous integration in GitLab needs a container having a Bourne shell program.

Also, the Rust modules were compiled with special flags, so that the executable size to be small.

### For the ```speed``` goal

In order to achieve a high speed of procesing, all components are developed in ```Rust``` language but one, which is developed in ```C``` language.

??Also, all the components are united in a single ```Rust``` executable.

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

* Maybe this [https://github.com/ballsteve/xrust](https://github.com/ballsteve/xrust) is a replacement for ```xsltproc```.

* Include all the processing steps in a single Rust executable, called ```indexing-backend```.

## Resources

[https://github.com/phusion/baseimage-docker](https://github.com/phusion/baseimage-docker)

[http://zderadicka.eu/static-build-of-rust-executables/](http://zderadicka.eu/static-build-of-rust-executables/)

[https://github.com/rust-cross/rust-musl-cross](https://github.com/rust-cross/rust-musl-cross)

[SlimToolkit](https://github.com/slimtoolkit/slim)

[muslrust](https://github.com/clux/muslrust/tree/main)

[Using GitHub Actions to automatically update the repo's submodules](https://stackoverflow.com/questions/64407333/using-github-actions-to-automatically-update-the-repos-submodules)

[Publishing and installing a package with GitHub Actions - GitHub Docs](https://docs.github.com/en/packages/managing-github-packages-using-github-actions-workflows/publishing-and-installing-a-package-with-github-actions#upgrading-a-workflow-that-accesses-a-registry-using-a-personal-access-token)
