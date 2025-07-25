# homework
terraform

```hcl

region = "us-east-1"
key_name = "Homework4-key"
ports = [22, 80, 443, 3306]

ec2_web = {
    ami_id        = "ami-08a6efd148b1f7504"
    instance_type = "t2.micro"
}

vpc = [{
    cidr = "10.0.0.0/16"
    name = "kaizen"
    enable_dns_support = true
    enable_dns_hostnames = true
}]

subnets = [

    {az = "us-east-1a", cidr_block  = "10.0.1.0/24", name = "public-subnet-1",  map_public_ip_on_launch = true}, 
    {az = "us-east-1b", cidr_block = "10.0.2.0/24", name = "public-subnet-2",  map_public_ip_on_launch = true},
    {az = "us-east-1c", cidr_block = "10.0.3.0/24", name = "private-subnet-1",  map_public_ip_on_launch = false},
    {az = "us-east-1d", cidr_block = "10.0.4.0/24", name = "private-subnet-2",  map_public_ip_on_launch = false}
]

internet_gateway = "my-igw" 

route_table = ["public-rt", "private-rt"]
```