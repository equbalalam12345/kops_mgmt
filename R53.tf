resource "aws_route53_zone" "hvpc" {
  name = "hvpc.shop"  # Change to your domain name
}


output "hvpc" {

  value = "${aws_route53_zone.hvpc.name_servers}"
  }
