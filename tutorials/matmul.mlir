

module {
    func.func @matmul_tensors_1(
        %arg0: tensor<128x128xf32>, %arg1: tensor<128x128xf32>,
        %arg2: tensor<128x128xf32>)
            -> tensor<128x128xf32> {
        %0 = linalg.matmul { test.attrA, test.attrC }
                            ins(%arg0, %arg1: tensor<128x128xf32>, tensor<128x128xf32>)
                            outs(%arg2: tensor<128x128xf32>)
            -> tensor<128x128xf32>
        func.return %0 : tensor<128x128xf32>
    }

    transform.with_pdl_patterns {
        ^bb0(%arg0: !pdl.operation):
        pdl.pattern @pdl_target_attrA : benefit(1) {
            %args = operands
            %results = types
            %attr = attribute
            %0 = operation "linalg.matmul"(%args : !pdl.range<value>) {"test.attrA" = %attr}-> (%results : !pdl.range<type>)
            rewrite %0 with "transform.dialect"
        }

        pdl.pattern @pdl_target_attrC : benefit(1) {
            %args = operands
            %results = types
            %attr = attribute
            %0 = operation "linalg.matmul"(%args : !pdl.range<value>) {"test.attrC" = %attr}-> (%results : !pdl.range<type>)
            // TODO: we don't want this, but it is the required terminator for pdl.pattern
            rewrite %0 with "transform.dialect"
        }

        transform.sequence %arg0 : !pdl.operation failures(propagate) {
        ^bb1(%arg1: !pdl.operation):
            %0 = pdl_match @pdl_target_attrA in %arg1 : (!pdl.operation) -> !pdl.operation
            transform.structured.tile %0 [8, 8, 8] : (!pdl.operation) -> (!pdl.operation, !pdl.operation, !pdl.operation, !pdl.operation)
            %1 = pdl_match @pdl_target_attrC in %arg1 : (!pdl.operation) -> !pdl.operation
            %2 = transform.get_closest_isolated_parent %1 : (!pdl.operation) -> !pdl.operation
            transform.structured.vectorize %2 : (!pdl.operation) -> !pdl.operation
        }
    }
}
