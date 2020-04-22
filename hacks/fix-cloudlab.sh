#! /bin/bash
#
# Usage: $ bash <(curl -sL https://bit.ly/3bAHoQY)
#

# Verifies if user is logged
oc whoami > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo 'You must be logged on Cloud Lab !'
    exit 1
fi

# Gives feedback to user and start
echo -n 'Applying patch to resources... '

# Reduces the replica count for IBM 
oc scale deployment $(oc get deployments -n ibm-system -l=ibm-cloud-provider-ip -o=jsonpath='{.items[*].metadata.name}') --replicas=1 -n ibm-system > /dev/null 2>&1

# Reduces replica count for OpenShift Router updating the IngressController CR
oc patch ingresscontroller default --type=merge --patch='{"spec": {"replicas": 1}}' -n openshift-ingress-operator > /dev/null 2>&1

# Gives feedback to user and exits
echo 'done!'
exit 0
