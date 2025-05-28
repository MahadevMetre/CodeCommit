type              = "ingress"
from_port         = 5432
to_port           = 5432
protocol          = "tcp"
cidr_blocks       = ["202.168.90.114/32"]
security_group_id = "sg-0aca7ee638128284c"
description       = "Virtusa ODC connectivity" 