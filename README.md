
```
terraform init
terraform plan -var-file=./secrets/terraform.tfvars -var-file=./terraform.tfvars
terraform apply -var-file=./secrets/terraform.tfvars -var-file=./terraform.tfvars
```


```
terraform state list | grep vlan | xargs -I {} terraform state show {} | grep vlan_number | awk -F\= '{print $2}' | tr -d '[:blank:]'
```



ibmcloud sl vlan list|grep ci_vlan | cut -d ' ' -f 1| xargs -I {} ibmcloud sl vlan detail {}
ibmcloud sl vlan list|grep ci_vlan | cut -d ' ' -f 1| xargs -I {} ibmcloud sl vlan detail --no-vs --no-hardware --output json {} > data.json
jq '.subnets[].gateway' data.json
jq '.vlanNumber' data.json

jq '.subnets[] | select(.gateway != null) | .gateway' data.json > gateways.txt

gateways=$(jq '.subnets[] | select(.gateway != null) | .gateway' gateways.txt | sort)

jq '{vlans: .vlanNumber, gateway: .subnets[0].gateway, networkIdentifier: .subnets[0].networkIdentifier }' data.json

jq '{vlans: .vlanNumber, gateway: .subnets[0].gateway}' data.json >> vlans_and_gateways.yaml



ibmcloud sl vlan list|grep ci_vlan_connect | cut -d ' ' -f 1| xargs -I {} ibmcloud sl vlan detail --no-vs --no-hardware --output json {} | jq -s . > cdata.json
ibmcloud sl vlan list|grep ci_vlan_disconnect | cut -d ' ' -f 1| xargs -I {} ibmcloud sl vlan detail --no-vs --no-hardware --output json {} | jq -s . > ddata.json





It is to create a Portable VLAN for vSphere vCenter to run in. We will also run any other services needed to support vsphere.



You will need to get the current private_vlan via ibmcloud cli
 ibmcloud sl vlan list | grep private
 ibmcloud sl hardware list | grep gateway


