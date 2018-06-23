resource "aws_eks_cluster" "jobbatical-eks-cluster" {
  name     = "${var.cluster-name}"
  role_arn = "${aws_iam_role.jobbatical-eks-iam-role.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.jobbatical-eks-sg.id}"]
    subnet_ids         = ["${aws_subnet.jobbatical-az-1-subnets.*.id[1]}", "${aws_subnet.jobbatical-az-2-subnets.*.id[1]}"]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.jobbatical-eks-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.jobbatical-eks-AmazonEKSServicePolicy",
  ]
}
