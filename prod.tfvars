vpc_cidr="10.1.0.0/16"

env="prod"
instance_type="t3.large"
public_subnet = [
     {
        name = "public-subent-1"
        cidr = "10.1.1.0/24"
        zone = "us-east-1a"
    } ,
     {
        name = "public-subent-2"
        cidr = "10.1.2.0/24"
        zone = "us-east-1b"
    } ,
         {
        name = "public-subent-3"
        cidr = "10.1.3.0/24"
        zone = "us-east-1c"
    } 
]

private_subnet = [
     {
        name = "private-subent-1"
        cidr = "10.1.4.0/24"
        zone = "us-east-1a"
    } ,
     {
        name = "private-subent-2"
        cidr = "10.1.5.0/24"
        zone = "us-east-1b"
    } ,
         {
        name = "private-subent-3"
        cidr = "10.1.6.0/24"
        zone = "us-east-1c"
    } 
]