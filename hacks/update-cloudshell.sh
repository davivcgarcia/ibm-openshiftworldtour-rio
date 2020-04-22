#! /bin/bash
#
# Usage: $ source <(curl -sL https://bit.ly/34VpXrD)
# 

# Gives feedback to user and start
echo -n 'Updating binaries... '

# Create a local binaries directory
mkdir -p $HOME/.local/bin
cd $HOME/.local/bin 2>&1 /dev/null

# Downloads binary for OpenShift client
curl -sL https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz | tar xz oc

# Downloads binary for ODO Client
curl -sL https://mirror.openshift.com/pub/openshift-v4/clients/odo/latest/odo-linux-amd64 -o odo

# Downloads binary for Kubernetes client
curl -sLO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

# Make sure all binaries are executable
chmod -R +x $HOME/.local/bin

# Add local binaries directory to exports
echo -e '\nexport PATH=$HOME/.local/bin:$PATH' >> $HOME/.bashrc

# Source .bashrc
source $HOME/.bashrc

# Gives feedback to user and returns
cd $HOME 2>&1 /dev/null
echo 'done!'
