# Using Vagrantfile

Prerequisites: Vagrant installed and working.

Retrieve sensu-puppet, go into the examples directory which contains the
Vagrantfile, and tell Vagrant to take over:

    git clone https://github.com/sensu/sensu-puppet.git
    cd sensu-puppet/examples
    vagrant up

# Example Puppet manifest

See examples/manifests/site.pp for a minimal Puppet manifest to install
prerequisites for Sensu. The example expects the following to have already
happened:

    puppet module install thomasvandoren/redis
    puppet module install puppetlabs/rabbitmq
    puppet module install sensu/sensu

(The Vagrantfile does this automatically as part of the shell provisioner.)