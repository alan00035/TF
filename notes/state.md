https://free-braindumps.com/hashicorp-braindumps-free.html
new2013xxxx
12345


terraform state can contain sensitive data, resource IDs and all resource attributes.  local state, state is stored in plain=text json files. using remote state, state is only eheld in membery when isd by tf, it mayb be encrypted at reast treat thes tate iteself as senstive data, storey dts afcan provterid bettern security. 

tf cloud alway s encryptes state at rest and protect it with TLS IN TRANSIT . TF CLOUD ALSO KNOWS THE IDENTITY OF THE USER REQUESITNG STATES AND MANATIN A HISTORY OF STATE HCANGE. THIS CAN BE USED TO CONTROAL ACCESS AND TRACK ACRTIVTIEY. TF ENT ALSO SUPPORT AUTDIT LOGIGN G. THE 3 BACKEND SUPPORT ENCRYPTED AT ETHEN ENCY OPTINIS Atls conneciton 

terraform refresh -> read the current settigns from all managed remote objs and updates the tf state to match  it wont moditfy the real mremote obj but it will moditfy the tf state. u shouldnmt use this commnt tf plan n tf apply 
terraform fresh 

terraform apply -refresh-only

backednd where and how operations are performed. where state snapshots area stored , etc. 

backend configuration is only used by tf cli. tf cloud and tf ent alwasy use their own state storage when perform tf runs tf includes a built in selectoin gof backednds. the built in backedns are the only bandked you cannnotNOT load addiont balck as plugaion


store the states
perform apis 

tf uses persistenct state data to keep track of yhe reoursf vit manages. local backed storeag state as a local file on tdiska

operations refers to performing api request againa s infr stervice in odrt o crate, read, update or destroy resources. 

enhance - local / remote - store state n perform opertations - 
standard - store states, n use local backedn to do the api operations 
terraform.tfstate

debugging
tf has detailsed logs whicha n be enablesd by TF_LOG env vars to any value on stderr
TF_LOG to one of the log levels TRACE, DEBUG, INFO, WARN OR ERROR 

TF_LOG_PATH in oder to force the log to always be appended to a spe file whe

appp.terraform.io 

tf cloud shows outpu on the root level outputs. 

data.rf_remote_state.vpc.outputs.subnet_id

tf wont capture the configration from vcs, hence you will need to use ur own tooling to upload the configrautions such as .tar.gz files 

UI/VCS driven run
api driven run
CLI driven run

*.auto.tfvars

sentinal is a policy as code framework, use to define and endore granular policies for how ur org provisions infrastructure.

sentitanl will have th policied checked when the run is fperfomr, after tf plan beu before it tf apply 

sentanoal provide a simple policy -oriented langagne sentinel 

tf refresh does not modify infr but does modify the state file.

required_providers {
    source
}


tf state list is used to list all resources in the state
tf state show is used to show the attribute of singel resource in the  file

tf cloud also knows the identity of the user requiresing staty 

verbose logging to ts, trace provides the most verboase loggins stderr. TF_LOG , trace, debug, info, warn or error 
use data source aws_ami

terraform init -upgrade  this will update the latest acceptable version of each provider, and latest acceptable version of tf modules

tf is built in plugin-based infrastructure; every providers and provisioners are consider as 

init:
copy a source module
backend initialisezation
child module installation
plugin installation

metadata  such as resource dependencies
tf stores a cache of the attribute values for all resources in the state

tf typically uses the configuration to determine dependency order.  retians a copy of the most recent set of de within the stae n otf can still determine the correct order for destruction from the state 

terraform write in goLang

module "xxx" {
    source ="./xxxx"
    version ="0.01"

    server =3
}

the resources defined in a module are encapsulated, so the calling module cannot access theri attributes directly.

