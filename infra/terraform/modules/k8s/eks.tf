resource "aws_eks_cluster" "main" {
  name     = "tuote"
  role_arn = aws_iam_role.cluster.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.az_1.id,
      aws_subnet.az_2.id
    ]
  }

  depends_on = [ 
    aws_vpc.eks,
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy
  ]
}