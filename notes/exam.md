Exam study

Iac
using a high-level configuration syntax to define, deploy , modify, excute and destroy infrastructure

what is infrastruture - CPUS, memory, disk, firewalls, network, etc. 

Iac provides human readable scripts , make it easy to provision and apply infratructure configurations. it standardizes workflows across different providers by using common syntax across all of them.

purpose of tf state 
use tag to map configuration, but not all cloud provider or resources support tag;
hence tf uses its own state structure to manage configuration mapping. 
tf stores a cache of the attribute values of all resources in the state. 

in the default configuration, tf stores the states in a file in the current working directory where tf was run.
remote state is recommand for multiple users in the same tf, to allow everyone to be working with the same states. 

TF syntax:
"hashicorp configuration language"
- human readable
- suport configurate syntax and expressions
- conditionals, functions, templates

terraform will map the configuration with actual resources, if there is no update on either way, redeployment will make NO change as the define configuration matched with the physical status


Value type:
String; Numbers; bool;
map; {name = "xx", age = "xx"} //map can mix with variable
list; e.g ["bean","beef"] 
set; 
tuple; 


Steps:
$terraform init -get-plugins=false
$terraform validate 
$terraform  plan  -> check the current states before determine the changes
it will generates an execution plan, it shows what tf will do when you apply.
terraform init
validate

$terraform apply -auto-approve -> refresh the states
e.g. replace a new ami ; instead of update, it will destroy the existing instance and create a new one 

$terraform destroy
print out an execution plan to tell the user what will happen
then confirm yest
it will apply the plan

$terraform output

$terraform fmt 

$terraform taint  

$terraform import

$terraform workspace [new]/ [select]

# Backend
tf includes a build-in backed to store state and perform the operations
- local backend
- remote backend

state lock

$terraform refresh

a configuration can only provied one backend block
a backend block cannot refer to named values
default backend is local one; if the backend configuraiton changes, tf init must be run again to validate and configure the backend before any activities performance 

tf state can contains sensitive data, it contains resource IDs and resource attributes; 
- when use local state, state is stored in plain text JSON files
- remote state, state is only held in memory , it might be encrypted at rest . Storing state remotely can provide better security. 

## sentinel
sentinel is an embedded policy as code framework integrate with HashiCorp Ent products. 
Definite the policey -> manage it-> enforce policy checks on runs -> mocking sentinel tf data



#################################################################
terraform fmt -diff       //see the difference
terraform fmt -recursive  //see the subdirectory
terraform fmt -list=false
terraform.tfstate

terraform taint resource.id
terraform taint address
terraform taint -state-=path
terraform import [option] addres id

workspace
*you can NOT delete default workspace 
terraform workspace list
terraform workspace new <name>
terraform workspace show //current workspace
terraform workspace select <workspace name>  //switch between multiple workspace
terraform workspace delete <//>

state is used by tf to map real world resource to configuration. 
terraform state list
terraform state list <resource name>
terraform state show <resource name>

## Debug
TF_LOG env - detail logs
trace(default), degug, info, warn, error 
crash.log / panic message

## seperate workspace & directory 
directory seperate  rely on duplicate tf code.
workspace seperated env use the same tf code but have diff state files.

terraform state pull  //pull a remote state
terraform state push //manually upload a local state file to remote state

${terraform.workspace}  //access to the current workspace 

for local state, tf stores the workspace states in a directory called terraform.tfstate.d
for remote state, tf store the workspace states directly in the configured backend. 

$terraform state rm 'packet_device.worker'  //rm items from state

$terraform state mv 'module.app' 'module.parent.module.app'   // move state


//public register
module "consul" {
    source = "hashicorp/consul/aws"
    version = "0.1.0"
}

//prviate register
module "vpc" {
    source = "app.terraform.io/example_corp/vpc/aws
    version ="0.1.0"
}

then terraform init will download and cache the modules reference by configurations

where all plugins store
~/.terraform.d/plugins
$APPDATA$\terraform.d\plugins

################################################################
terraform plan -out=tfplan  //save the execution plan
terraform apply tfplan
terraform init -from-module=MODULE-SOURCE  //copy a source module to create one
terraform plan -details-exitcode // -target=resource address // -refresh=true

move state from remote to local:
remove the backed configuration in tf, run tf init, default state is local

terraform refresh //doesNOT change infrastructure but does update state file

# Variables
Env variables only support string type
file var support string, number,bool, map, list,ser, object, tuple

e.g.
terraform apply -var-file ="dev.tfvars"
terrafomr apply -var-file ="test.tfvars"

TF has build in function and do NOT accept user defined functions 

parseint ("100",10)  //change strin gto a number 

conditions = can (formatdate("", var.timestamp)) //evaluate given expression and return a boolean 

locals {
    example = try(   //try -> return the result of the first one

    )
}

filebase64(path)  //reads a file path and return a base64-encoded string

formatdata(spec, timestamp)

jsonencode({"hello"="world})  //encode a given value to a stirng use JSON syntax.

cidrhost("10.12.127/0,16)  //cal a full host ip add for a given host number