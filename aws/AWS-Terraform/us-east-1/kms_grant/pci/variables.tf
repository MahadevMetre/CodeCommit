variable "name" {
    type = string
}

variable "key_id" {
    type = string
}

variable "iam_arn" {
    type = string
}

variable "operations" {
    type = list(string)
}