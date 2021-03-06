cloud-tools
===========


A set of utilities by <a href="https://www.korekontrol.eu/">Marek Obuchowicz, KoreKontrol</a>
for controlling cloud resources via API. All calls are made by interface
mechanism offered by Fog gem, therefore is *cloud-independent*.

Current code has been tested with Rackspace Cloud UK only. Further feedback welcome.

Tools are in development status and offered functionality is still very limited. At the moment
only DNS commands are implemented. Compute calls will follow.

### Configuration
Code ships with `config-sample.yml` file. Save it as config.yml and provide cloud credentials.
You can use the section "default" for all service APIs (DNS, Compute, Storage) or, alternatively,
specify different providers for each service. Supplied parameters for each provider are passed
directly to the `Fog` gem calls. Please check fog documentation for detailed connection configuration
options.

### Synopsis
```
GLOBAL SYNTAX
    ct [global options] <command> [command options] [arguments...]

DNS API
    ct [global options] dns  domain-list
    ct [global options] dns [-t type|--record-type type] record-create <fqdn> <value>
    ct [global options] dns [-f|--force] record-delete <fqdn>
    ct [global options] dns  record-list <domain>

LOADBALANCER API (Rackspace only at the moment)
    ct [global options] lb  list
    ct [global options] lb  show <lb_name>

COMPUTE API

OBJECT STORAGE API

DATABASE API

```

### License
See [LICENSE](../master/LICENSE) file.
