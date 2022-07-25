reference :
https://github.com/ned1313/Getting-Started-Terraform 
https://github.com/ned1313/Deep-Dive-Terraform 

make all changes in TF

states

planning
    inspect state file 
    dependency graph -> e.g create ec2, also check subnet require
    additions, updates and deletions
    parallel execution
    save the plan
    


scenario 1 deploy a new ec2 in default vpc subnet with dns record

add a VPC
resource "aws_vpc" "vpc" {}
resource "aws_internet_gateway" "igw"{}
resource "aws_subnet" "subnet1" {}
resource "aws_route_table" "rtb" {}
resource "aws_route_table_association" "rta-subnet1" {}


comment
terraform init
terraform plan -out start.tf
terraform apply "xxxx"

----
TF Syntax:
"HashiCorp configuration languge" 
- human readable and editable; 
- support configuration syntax and expressions; 
- conditionals, functions, tempaltes

value type
string; number; bool; 
<!-- list & map return as array put in the position or key value -->
list = ["bean", "beef"]
map= {name ="xx", age ="xx" } //map can mix with variables type; 


keyword
var.xxx
aws_instance.xxx.name
local.xxx.xxx
module.xxx.xxx
s
Interpolation
xxx_name = "neds -${var.xxx}"


Block
block_type  label_one label_tow {
    key = value
    embedded_block {
        key = value
    }
}

example:
<!--      service type;     lias refer to -->
resource "aws_route_table" "route-table" {
<!-- which vpc the route table attched to  -->
    vpc_id ="string "
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id ="string"
    }


## multiple environment
decisions

state management ->
e.g.
1)$terraform plan -state =".\dev\dev.state"
    -var-file ="common.tfvars"
    -var-file=".\dev\dev.tfvars"

2)use workspace
$terraform workspace new dev  //it will create a new folder and new files 
$terraform plan  //to run main_config.tf

where to store variable data
credentials management
complexity and overhead

## Secret managment
options:
- var file
- env variable
- secrets management

## Module
code reuse
can be remote or local source
root module
versioning
provider inheritance 

Module Component
input var -> resources -> output file
