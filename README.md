leshan
======

leshan is a lwm2m system from leshan.eclipse.org.

This repository provide a system to run the latest demo lwm2m and bootstrap servers provided by Hudson (https://hudson.eclipse.org/leshan/).

Run
---

Server:
``
docker run --rm -ti --name leshan-server corfr/leshan
``

Bootstrap server:
``
docker run --rm -ti --name leshan-bootstrap --link leshan-server corfr/leshan bootstrap
``
`
