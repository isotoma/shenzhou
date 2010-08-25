= Shenzou Package Builder =

Shenzou exists primarily to showcase the virtualization support recently added to buildout 0.8.x. We will build a small scale system for building ubuntu packages in a clean environment from a Git repository.

We are now testing on a lucid amd64 host. It should work on karmic and on i386, but these are not currently supported.

Get the source. Currently we need Git buildbot, and that is provided via Git submodules.
{{{
git clone git://github.com/Jc2k/shenzou
git submodule update --init
}}}

Make sure apt is up to date:
{{{
sudo apt-get update
}}}

Install base packages.
{{{
sudo apt-get install kvm libvirt-bin python-libvirt python-setuptools python-dev build-essential ubuntu-vm-builder python-twisted-mail python-twisted-words python-twisted-web python-zc.buildout
}}}

Make sure user is in libvirtd group. You will need a fresh login for this to take effect.
{{{
sudo usermod -a -G libvirtd username
}}}

Build the master.
{{{
cd shenzou
buildout2.6
}}}

To update the virtual network configuration:
{{{
./network.sh
}}}

We need base VM images to run integration on.
{{{
sudo ./vmbuilder
mv ubuntu/tempname.qcow2 var/vms/base_image
rm -rf ubuntu
}}}

To start the builder:
{{{
./bin/shenzou start
}}}

