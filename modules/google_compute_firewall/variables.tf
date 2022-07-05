variable "rules" {
  type = list(object(
    {protocol=string,
      name=string,
    ports=list(any),
    source_ips=list(string),
    destination_tags=list(string)}))
  description = "List of firewall rules defined as object"

}

variable "project_id" {
  type = string
}

variable "network" {
  type = string
}
//[{"protocol":"tcp", ports:{80,22,443}, source_ips:["192.168.1.1/32", "10.10.10.10/32"], destination_tags:["one,"two"]