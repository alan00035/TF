terraform support multiple providers

functions
Func_name(arg1 , arg2, arg3 ...)
function can be tested in tf console

Numeric : min(,);
String : lower();
Collection: merge (map1, map2);
Filesystem: file(path);
IP network :  cidrsubnet();
Date and time : timestamp (); //this function doesnt take argument

## EXAMPLE ##
#Configure network
variable network_info{
    defualt = 10.1.0.0/16 
}

#returns 10.1.0.0/24
cidr_block = cidrsubnet(var.network_info, 8, 0)
#return 10.1.0.5
host_ip = cidrhost(var.network_info, 5)
