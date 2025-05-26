function createFilterMatrix(λrange::Vector{T}) where T

    Matrix([filter_u.(λrange)/sum(filter_u.(λrange))  filter_g.(λrange)/sum(filter_g.(λrange))  filter_r.(λrange)/sum(filter_r.(λrange))   filter_i.(λrange)/sum(filter_i.(λrange))   filter_z.(λrange)/sum(filter_z.(λrange))])

end