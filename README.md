## vagrant-broadleaf

This project aims to provision a simple [Broadleaf](http://www.broadleafcommerce.org/) instance
using Vagrant and Puppet.

This project specifically is an alternative to list of instructions documented in [Broadleaf's Getting Started](http://www.broadleafcommerce.com/docs/core/current/getting-started).
Rather than downloading Eclipse and a JDK, running some specific ant targets, Vagrant and Puppet automate those steps.

### Requirements

Warning: The virtual machine that will be provisioned by vagrant will have 2 GB of RAM.

1. Install [VirtualBox](https://www.virtualbox.org/)
2. Install [Vagrant](https://www.vagrantup.com/)
3. Clone or download this repository to the root of your project directory: `git clone https://github.com/nblair/vagrant-broadleaf.git`
4. In your project directory, run `vagrant up`

Be prepared to wait; the first launch of the site may take around 5 minutes.

### Using

To access the site, point your browser at [http://localhost:8080/mycompany](http://localhost:8080/mycompany).
To access the admin console, point your browser at [http://localhost:8080/admin](http://localhost:8080/admin). Log in with username *admin* and password *admin*.

