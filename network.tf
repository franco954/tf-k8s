//utilizamos el modulo de vpc

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = "my-vpc"
    cidr = "10.0.0.0/16"

    azs = ["us-east-1a", "us-east-1b", "us-east-1d"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    public_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

    // lo habilitamos para que nuestras public subnets puedan acceder a internet y los clientes de afuera al cluster entonces
    create_igw = true   

    // para que las private subnets puedan conectarse a internet
    enable_nat_gateway = true
    single_nat_gateway = true


    tags = {
        terraform = "true"
        enviroment = "tutorial"
    }
}

