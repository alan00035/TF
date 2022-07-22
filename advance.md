import existing resources
managing state data
workspaces and collaboration
data sources and templates
adding a CICD pipeline
integrate with config managers


Syntax
terraform import [options] ADDR ID
 //ADDR - configuration resource identifier
 Example: module.vpc.aws_subnet.public[2]

 ID - provider specific resource identifier
 Example: subnet-xxxxxx

 # Terraform state
 Resources mappings and metadata in JSON format
 access via CLI, but do NOT edit
 refreshed during operations and stored in backends (standard & enhanced)

 //Commands
 $terraform state list      //list objects in state data 
 $terraform state show module.vpc.aws_vpc.this[0]    //show details about an object
 $terraform state mv        //move an item in state
 $terraform state rm
 $terraform state pull
 $terraform state push

 states stored in backend
 - standard & enhanced
 - locking & workspaces

 backends must be 3 initialised, partial configurations are recommanded, interpolation is not supported

 Example

 #Basic backend configuration
 terraform {
     backend "type" {
         #backend info
         #authentication info
     }
 }

 #Backends option: Consul, aws s3, azure storage, google cloud storage;

#Migrate state 
update the configuration -> cp backend.tf
initialise the config
confirm the migration

# Data source & Template
//data source types
resources are data sources
providers have daa sources
alternate data sources 
- templates
- Http
- External
- Consul

//example:
data "http" "my_ip"{
    url = "http"//ifconfig.me"
}
#use it
data.http.my_ip.body

#consul data source
data "consul_keys" "networking" {
    key {
        name = "vpc_cidr_range"
        path ="networking/config/vpc/cidr_range"
        default="10.0.0.0/16"
    }
}

#use it  *Consul works in Key/Value pair
data.consul_keys.networking.var.vpoc_cidr_range

//config from external sources

//template
#simple interpolation
"${var.prefix}-app"

#condition directive
"%{ if var.prefix != "}${var.prefix}-app%{ else }generic-app%{ endif}"

#collection directive with heredoc
<<EOT
%{ for name in local.names }
${name}-app
%{ endfor }
EOT

#template data source
data"template_file" "example" {
    count ="2"

    template = $${var1}-$${current_count}"

    vars ={
        var1 = var.some_string
        current_count = count.index
    }
}

or you can define the template in txt
example:

data "temlplate_file" "peer-role"{
    template = file("peer_policy.txt")
    vars ={
        vpc_arn= var.vpc_arn
    }
}
or
templatefile("peer_policy.txt", {vpc_arn = var.vpc_arn})

# Workspaces & Collaboration
workspace
common configuration ; individual state data instance ; multiple environments ; terraform.workspace

state as data source
example:

data "terraform_remote_state" "networking" {

    backend = "consul"

    config ={
        path = var.network_path
        address = var.consul_address
        scheme = var.consul_schemes
    }
}


## Troubleshooting
validate configurations
enable verbose logging
resource taints
crash logs

//Types of Errors
Command error - bad CLI syntax or arguments 
Syntax validation - terraform init first -> check syntax and logic -> does NOT check state    // manual or automatic
   $terraform validate

Provider validation
$terraform apply -out dev.tfplan

deployment error
TF breaks

//command syntax
$terraform taint/untaint [options] address

## CICD
automation and CI/CD

Pipeline process
connect to SCM (git) to get pipeline script(TF)

Ansible


Immutable deployment
Create image -> deploy instance -> update image -> deploy update