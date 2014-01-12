cloud-tools
===========

A set of utilities for controlling cloud resources via API. All calls are made
by interface mechanism offered by Fog, therefore is cloud-independent.

## SYNOPSIS
```
    ct [global options] command [command options] [arguments...]

    ct [global options] dns  domain-list
    ct [global options] dns [-t type|--record-type type] record-create fqdn value
    ct [global options] dns [-f|--force] record-delete fqdn
```    
    
